//
//  BaseAPI.swift
//  Util
//
//  Created by Savvycom on 13/11/2022.
//

import Alamofire
import RxSwift
import RxCocoa
import Const

protocol BaseAPIProtocol: AnyObject {
    associatedtype Response
    
    func convertToObject(from data: Data) -> (Response?, Error?)
    func path() -> String
    func params() -> Parameters?
    func method() -> HTTPMethod
    func request() -> Observable<Response>
}

class BaseAPITimeout {
    static let shared = BaseAPITimeout()
    
    var timer: Timer?
    
    func reset() {
        timer?.invalidate()
        timer = nil
    }
    
    func start(completion: @escaping (() -> Void)) {
        timer = Timer.scheduledTimer(withTimeInterval: 15.0, repeats: false, block: { _ in
            completion()
        })
    }
}

open class BaseAPI<Response: Decodable>: BaseAPIProtocol {
    private lazy var sessionManager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        return sessionManager
    }()
    
    public init() { }
    
    func convertToObject(from data: Data) -> (Response?, Error?) {
        do {
            let object = try JSONDecoder().decode(Response.self, from: data)
            return (object, nil)
        } catch let error {
            return (nil, error)
        }
    }
    
    open func path() -> String {
        return ""
    }
    
    open func params() -> Parameters? {
        return nil
    }
    
    open func method() -> HTTPMethod {
        return .get
    }
    
    public func request() -> Observable<Response> {
        let url = UrlConstant.kNewsHost + path()
        
        return Observable.create { observable in
            DispatchQueue.main.async {
                BaseAPITimeout.shared.reset()
                BaseAPITimeout.shared.start {
                    observable.onError(NSError(domain: "Timeout", code: -1001, userInfo: nil))
                    observable.onCompleted()
                }
            }
            self.sessionManager.session.getAllTasks { tasks in
                tasks.forEach({ $0.cancel() })
            }
            self.sessionManager.request(url, method: self.method(), parameters: self.params(), encoding: JSONEncoding.default, headers: nil)
                .responseJSON { response in
                    guard let httpResponse = response.response, let data = response.data else { return }
                    DispatchQueue.main.async {
                        BaseAPITimeout.shared.reset()
                    }
                    if httpResponse.statusCode < 200 || httpResponse.statusCode > 300 {
                        if httpResponse.statusCode == 403 || httpResponse.statusCode == -1001 {
                            observable.onError(NSError(domain: "Timeout", code: -1001, userInfo: nil))
                            observable.onCompleted()
                        }
                        return
                    }
                    
                    switch response.result {
                    case .success(_):
                        let (object, error) = self.convertToObject(from: data)
                        if let `object` = object {
                            observable.onNext(object)
                            observable.onCompleted()
                        } else if let `error` = error {
                            observable.onError(error)
                            observable.onCompleted()
                        }
                    case .failure(let error):
                        observable.onError(error)
                        observable.onCompleted()
                    }
                }
            return Disposables.create()
        }
    }
}

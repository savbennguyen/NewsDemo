//
//  UseCase.swift
//  Alamofire
//
//  Created by Savvycom on 13/11/2022.
//

public protocol UseCase: AnyObject {
    associatedtype DM
    associatedtype EM
    
    func execute(param: DM) -> EM
}

public protocol UseCaseWithoutParam: AnyObject {
    associatedtype EM
    
    func execute() -> EM
}

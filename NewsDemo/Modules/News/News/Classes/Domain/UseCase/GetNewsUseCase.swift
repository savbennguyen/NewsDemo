//
//  GetNewsUseCase.swift
//  News
//
//  Created by Savvycom on 13/11/2022.
//

import Util
import RxSwift

class GetNewsUseCase: UseCaseWithoutParam {
    typealias EM = Observable<Articles>
    
    private let repository = NewsRepositoryImplement()
    
    func execute() -> Observable<Articles> {
        return repository.getNews()
    }
}

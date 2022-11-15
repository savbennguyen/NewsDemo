//
//  SearchNewsUseCase.swift
//  News
//
//  Created by Savvycom on 13/11/2022.
//

import Util
import RxSwift

class SearchNewsUseCase: UseCase {
    typealias DM = String
    typealias EM = Observable<Articles>
    
    private let repository = NewsRepositoryImplement()
    
    func execute(param: String) -> Observable<Articles> {
        return repository.searchNews(query: param)
    }
}

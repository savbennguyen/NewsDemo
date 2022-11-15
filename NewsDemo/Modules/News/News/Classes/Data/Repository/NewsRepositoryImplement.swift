//
//  NewsRepositoryImplement.swift
//  News
//
//  Created by Savvycom on 13/11/2022.
//

import RxSwift
import Util

class NewsRepositoryImplement: NewsRepository {
    func getNews() -> Observable<Articles> {
        return GetNewsEndpoint()
            .request()
            .map({ $0.map() })
    }
    
    func searchNews(query: String) -> Observable<Articles> {
        return SearchNewsEndpoint(query: query)
            .request()
            .map({ $0.map() })
    }
}

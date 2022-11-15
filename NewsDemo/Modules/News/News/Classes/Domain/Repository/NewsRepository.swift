//
//  NewsRepository.swift
//  News
//
//  Created by Savvycom on 13/11/2022.
//

import RxSwift

protocol NewsRepository: AnyObject {
    func getNews() -> Observable<Articles>
    func searchNews(query: String) -> Observable<Articles>
}

//
//  ArticlesEntity.swift
//  News
//
//  Created by Savvycom on 13/11/2022.
//

import Util

public class ArticlesEntity: Decodable {
    var status: String?
    var totalResults: Int?
    var articles: [ArticleEntity]?
}

extension ArticlesEntity: Mapper {
    public typealias EM = Articles
    
    public func map() -> Articles {
        let articles = Articles()
        articles.status = status
        articles.totalResults = totalResults
        articles.articles = self.articles?.map { $0.map() }
        return articles
    }
}

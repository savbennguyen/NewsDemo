//
//  ArticleEntity.swift
//  News
//
//  Created by Savvycom on 13/11/2022.
//

import Util

class ArticleEntity: Decodable {
    var source: SourceEntity?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

extension ArticleEntity: Mapper {
    typealias EM = Article
    
    func map() -> Article {
        let article = Article()
        article.source = source?.map()
        article.author = author
        article.title = title
        article.description = description
        article.url = url
        article.urlToImage = urlToImage
        article.publishedAt = publishedAt
        article.content = content
        return article
    }
}

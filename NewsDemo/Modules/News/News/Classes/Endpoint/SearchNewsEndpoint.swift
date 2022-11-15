//
//  SearchNewsEndpoint.swift
//  Pods
//
//  Created by Savvycom on 13/11/2022.
//

import Util
import Const

class SearchNewsEndpoint: BaseAPI<ArticlesEntity> {
    private var query = ""
    
    init(query: String) {
        self.query = query
    }
    
    override func path() -> String {
        return String(format: UrlConstant.kSearchNewsEndpoint, query)
    }
}

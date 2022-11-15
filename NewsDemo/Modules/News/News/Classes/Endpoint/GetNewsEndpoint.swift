//
//  GetNewsEndpoint.swift
//  News
//
//  Created by Savvycom on 13/11/2022.
//

import Util
import Const

class GetNewsEndpoint: BaseAPI<ArticlesEntity> {
    override func path() -> String {
        return UrlConstant.kNewsEndpoint
    }
}

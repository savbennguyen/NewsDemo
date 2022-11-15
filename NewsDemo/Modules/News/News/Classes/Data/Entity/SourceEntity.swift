//
//  SourceEntity.swift
//  News
//
//  Created by Savvycom on 13/11/2022.
//

import Util

class SourceEntity: Decodable {
    var id: String?
    var name: String?
}

extension SourceEntity: Mapper {
    typealias EM = Source
    
    func map() -> Source {
        let source = Source()
        source.id = id
        source.name = name
        return source
    }
}

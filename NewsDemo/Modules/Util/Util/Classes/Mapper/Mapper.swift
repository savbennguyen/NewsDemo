//
//  Mapper.swift
//  Util
//
//  Created by Savvycom on 13/11/2022.
//

public protocol Mapper {
    associatedtype EM
    
    func map() -> EM
}

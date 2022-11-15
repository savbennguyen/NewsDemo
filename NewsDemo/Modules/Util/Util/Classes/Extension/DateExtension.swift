//
//  DateExtension.swift
//  Util
//
//  Created by Savvycom on 13/11/2022.
//

import Foundation

public extension Date {
    var year: Int {
        get {
            return Calendar.current.dateComponents([.year], from: self).year ?? 0
        }
        set {
            var components = Calendar.current.dateComponents([.second, .minute, .hour, .day, .month, .year], from: self)
            components.year = newValue
            self = Calendar.current.date(from: components) ?? Date()
        }
    }
    
    var month: Int {
        get {
            return Calendar.current.dateComponents([.month], from: self).month ?? 0
        }
        set {
            var components = Calendar.current.dateComponents([.second, .minute, .hour, .day, .month, .year], from: self)
            components.month = newValue
            self = Calendar.current.date(from: components) ?? Date()
        }
    }
    
    var day: Int {
        get {
            return Calendar.current.dateComponents([.day], from: self).day ?? 0
        }
        set {
            var components = Calendar.current.dateComponents([.second, .minute, .hour, .day, .month, .year], from: self)
            components.day = newValue
            self = Calendar.current.date(from: components) ?? Date()
        }
    }
    
    func string(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

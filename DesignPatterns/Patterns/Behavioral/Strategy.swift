//
//  Strategy.swift
//  DesignPatterns
//
//  Created by Lev Bondarenko on 05.02.2023.
//

import Foundation

protocol TextFormatterStrategy {
    func format(string: String) -> String
}

struct NumberFormmatter: TextFormatterStrategy {
    func format(string: String) -> String {
        var result = string.trimmingPrefix("")
        
        return "\(result)"
    }
}

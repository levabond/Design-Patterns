//
//  Singleton.swift
//  DesignPatterns
//
//  Created by Lev Bondarenko on 03.02.2023.
//

import Foundation


class Singleton {
    static let shared: Singleton = {
        let instance = Singleton()
        // setup code
        
        return instance
    }()
    
    private init() {}
}

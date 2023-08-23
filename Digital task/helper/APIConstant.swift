//
//  APIConstant.swift
//  Digital task
//
//  Created by mohmmadlotfeon 22/08/2023.
//

import Foundation

enum API :String{

    case post = "posts"
    
    static var basicURL : URL {
        return URL(string: "https://jsonplaceholder.typicode.com/")!
    }
    
    var url : URL {
        return API.basicURL.appendingPathComponent(self.rawValue)
    }
}

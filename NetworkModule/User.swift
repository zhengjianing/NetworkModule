//
//  User.swift
//  NetworkModule
//
//  Created by Jianing Zheng on 12/15/16.
//  Copyright © 2016 Jianing Zheng. All rights reserved.
//

import Foundation

struct User {
    
    let name: String
    let message: String
    
    init?(data: Data) {
        
        guard let object = try? JSONSerialization.jsonObject(with: data, options: []), let obj = object as? [String: Any] else {
            return nil
        }
        
        guard let name = obj["name"] as? String else {
            return nil
        }
        
        guard let message = obj["message"] as? String else {
            return nil
        }
        
        self.name = name
        self.message = message
    }

}

extension User: Decodable {
    static func parse(data: Data) -> User? {
        return User(data: data)
    }
}

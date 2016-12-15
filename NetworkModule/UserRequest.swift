//
//  UserRequest.swift
//  NetworkModule
//
//  Created by Jianing Zheng on 12/15/16.
//  Copyright © 2016 Jianing Zheng. All rights reserved.
//

import Foundation

struct UserRequest: Request {
    let name: String
    
    let host = "https://api.onevcat.com"
    var path: String { return "/users/\(name)" }
    let method: HTTPMethod = .get
    let parameter: [String: Any] = [:]
}

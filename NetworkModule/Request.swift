//
//  Request.swift
//  NetworkModule
//
//  Created by Jianing Zheng on 12/15/16.
//  Copyright © 2016 Jianing Zheng. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get
    case post
}

protocol Request {
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameter: [String: Any] { get }
    
    associatedtype Response: Decodable
}

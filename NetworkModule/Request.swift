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
    
    associatedtype Response
    func parse(data: Data) -> Response?
}

extension Request {
    func send(handler: @escaping (Response?) -> Void) {
        guard let url = URL(string: host.appending(path)) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data, let res = self.parse(data: data) {
                DispatchQueue.main.async {
                    handler(res)
                }
            } else {
                DispatchQueue.main.async {
                    handler(nil)
                }
            }
        }
        task.resume()
    }
}

//
//  Client.swift
//  NetworkModule
//
//  Created by Jianing Zheng on 12/16/16.
//  Copyright © 2016 Jianing Zheng. All rights reserved.
//

import Foundation

protocol Client {
    func send<T: Request>(_ request: T, handler: @escaping (T.Response?) -> Void)
    
    var host: String { get }
}

struct URLSessionClient: Client {
    let host = "https://api.onevcat.com"
    
    func send<T : Request>(_ r: T, handler: @escaping (T.Response?) -> Void) {
        guard let url = URL(string: host.appending(r.path)) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = r.method.rawValue
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data, let res = T.Response.parse(data: data) {
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

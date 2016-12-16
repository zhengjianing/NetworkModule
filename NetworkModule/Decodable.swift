//
//  Decodable.swift
//  NetworkModule
//
//  Created by Jianing Zheng on 12/16/16.
//  Copyright © 2016 Jianing Zheng. All rights reserved.
//
import Foundation

protocol Decodable {
    static func parse(data: Data) -> Self?
}

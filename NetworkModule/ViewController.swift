//
//  ViewController.swift
//  NetworkModule
//
//  Created by Jianing Zheng on 12/15/16.
//  Copyright © 2016 Jianing Zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let userRequest = UserRequest(name: "onevcat")
        userRequest.send { user in
            if let user = user {
                print("\(user.message) from \(user.name)")
            }
        }
    }


}


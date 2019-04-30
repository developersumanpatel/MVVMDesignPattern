//
//  LoginServiceManager.swift
//  MVVMDemo
//
//  Created by Suman on 16/04/19.
//  Copyright © 2019 Suman. All rights reserved.
//

import Foundation
class LoginServiceManager {
    static let shared = LoginServiceManager()
    
    func loginUser(with email: String, password:String, completion: @escaping CompletionBlock) {
        if let url = URL.init(string: "https:google.com?useremail=\(email)&userpassword=\(password)") {
            NetworkManager.shared.callGetApI(url: url) { (success, response) in
                if success, let userInfo = response as? [String: Any] {
                    let userModel = UserModel(dictionary: userInfo)
                    completion(success, userModel)
                } else {
                    completion(success, response)
                }
            }
        }
    }
}

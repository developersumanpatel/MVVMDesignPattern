//
//  LoginViewModel.swift
//  MVVMDemo
//
//  Created by Suman on 16/04/19.
//  Copyright © 2019 Suman. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {
    var email: String?
    var password: String?
    
    override init() {
        super.init()
    }
    
    func validateCredentials() -> Bool{
        return (email?.isValidEmail ?? false) && (password?.isValidPassword ?? false)
    }
    
    func loginNetworkCall(completion: @escaping CompletionBlock) {
        LoginServiceManager.shared.loginUser(with: email ?? "", password: password ?? "") { (success, response) in
            if success, let userModel = response as? UserModel {
                let userViewModel = UserViewModel(user: userModel)
                completion(success, userViewModel)
            }
            else {
                completion(success, response)
            }
        }
    }
}

class UserViewModel : NSObject {
    var id: String?
    var name: String?
    
    init(name: String) {
        self.name = name
    }
    
    init(user: UserModel) {
        self.id = user.id
        self.name = user.name
    }
}

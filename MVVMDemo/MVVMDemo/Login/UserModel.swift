//
//  UserModel.swift
//  MVVMDemo
//
//  Created by Suman on 16/04/19.
//  Copyright © 2019 Suman. All rights reserved.
//

import UIKit

class UserModel {
    var id: String?
    var name: String?
    
    init(dictionary: [String:Any]) {
        self.id = dictionary["id"] as? String
        self.name = dictionary["name"] as? String
    }
    
    init(viewModel: UserViewModel) {
        self.id = viewModel.id
        self.name = viewModel.name
    }
}

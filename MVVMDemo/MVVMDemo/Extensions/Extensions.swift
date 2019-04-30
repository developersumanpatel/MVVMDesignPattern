//
//  Extensions.swift
//  MVVMDemo
//
//  Created by Suman on 16/04/19.
//  Copyright © 2019 Suman. All rights reserved.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        return self.count > 8 ? true : false
    }
}

//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Suman on 16/04/19.
//  Copyright © 2019 Suman. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    lazy var loginViewModel: LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginClicked(_ sender: UIButton) {
        loginViewModel.email = emailTextField.text
        loginViewModel.password = passwordTextField.text
        
        if loginViewModel.validateCredentials() {
            loginViewModel.loginNetworkCall(completion: { [weak self](success, response) in
                if success, let userViewModel = response as? UserViewModel  {
                    print(userViewModel.name ?? "No name")
                } else {
                    self?.loginError((response as? String) ?? "Empty error")
                }
            })
        }
    }
}

extension LoginController {
    func loginError(_ errorMessage: String) {
        // show alert
    }
}

extension LoginController: UITextFieldDelegate {
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}


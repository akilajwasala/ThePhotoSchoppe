//
//  ViewController.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/30/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit
import PopupDialog

class RegisterViewController: UIViewController {

    private var viewModel = RegisterViewModel()

    @IBOutlet var txtUserName: ColoredTextView!
    @IBOutlet var txtPassword: ColoredTextView!
    @IBOutlet var txtEmail: ColoredTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func btnClickRegister(_ sender: UIButton) {
        
        guard let userName = txtUserName.text, userName.count > 2 else {
            self.showMessage(isError: true, title: Strings.ERROR, message: Strings.ERROR_INVALID_USERNAME) {}
            return
        }

        guard let password = txtPassword.text, password.count > 4 else {
            self.showMessage(isError: true, title: Strings.ERROR, message: Strings.ERROR_INVALID_PASSWORD) {}
            return
        }

        guard let email = txtEmail.text, email.isValidEmail() else {
            self.showMessage(isError: true, title: Strings.ERROR, message: Strings.ERROR_INVALID_EMAIL) {}
            return
        }
        
        viewModel.register(userName: userName, password: password, email: email, callback: self)
    }
    
}

extension RegisterViewController : UIRegistrationDelegate {
    
    func onUserRegistered() {
        self.showMessage(isError: false, title: Strings.SUCCESS, message: Strings.REG_SUCCESS) {
            self.performSegue(withIdentifier: NamedSegues.SegueRegToHome, sender: nil)
        }
    }
    
    func onRegistrationFailed(reason: String) {
        self.showMessage(isError: true, title: Strings.ERROR, message: reason) {}
    }
    
}

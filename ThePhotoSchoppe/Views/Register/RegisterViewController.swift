//
//  ViewController.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/30/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit

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
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func btnClickRegister(_ sender: UIButton) {
        
//        guard let userName = txtUserName.text, userName.count > 5 else {
//            return
//        }
//
//        guard let password = txtEmail.text, password.count > 3 else {
//            return
//        }
//
//        guard let email = txtEmail.text, email.isValidEmail() else {
//            return
//        }
        
//        viewModel.register(userName: userName, password: password, email: email, callback: self)
        viewModel.register(userName: "", password: "", email: "", callback: self)

    }
}

extension RegisterViewController : UIRegistrationDelegate {
    
    func onUserRegistered() {
        performSegue(withIdentifier: NamedSegues.SegueRegToHome, sender: nil)
    }
    
    func onRegistrationFailed(reason: String) {
        
    }
    
}

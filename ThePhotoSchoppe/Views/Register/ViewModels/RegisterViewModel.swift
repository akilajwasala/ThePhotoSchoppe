//
//  RegisterViewModel.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/30/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit

internal protocol UIRegistrationDelegate {
    func onUserRegistered()
    func onRegistrationFailed(reason: String)
}

class RegisterViewModel {

    internal func register(userName: String, password: String, email: String?, callback: UIRegistrationDelegate) {
        callback.onUserRegistered()
        
        /*
        if error
         callback.onRegistrationFailed(reason: reason)
         */
    }
}

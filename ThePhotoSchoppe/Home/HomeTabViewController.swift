//
//  HomeTabViewController.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/30/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit

class HomeTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackButtonHidden(hidden: true)
    }

    func setBackButtonHidden(hidden: Bool) {
        navigationItem.setHidesBackButton(hidden, animated: true)
    }

}

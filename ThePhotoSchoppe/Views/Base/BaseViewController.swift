//
//  BaseViewController.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 8/1/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setNavigationBar(isHidden: Bool) {
        self.navigationController?.setNavigationBarHidden(isHidden, animated: true)
    }
}

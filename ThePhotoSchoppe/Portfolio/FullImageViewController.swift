//
//  FullImageViewController.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/31/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit

class FullImageViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    var selectedItem: ImageItem?
    var emailButtonClickClosure: ((ImageItem) -> ())?
    var webSiteButtonClickClosure: (() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = selectedItem {
            //imgView.image = item.uiimage
        }
    }
    
    @IBAction func btnClickedClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnClickWebView(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.makeOtherViewsOnlyPortrait()
            self.webSiteButtonClickClosure?()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.makeOtherViewsOnlyPortrait()
    }
    
    @IBAction func btnClickedEmail(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.emailButtonClickClosure?(self.selectedItem!)
        }
    }
    
    @objc func canRotate() -> Void {}
    
    fileprivate func makeOtherViewsOnlyPortrait() {
        UIDevice.current.setValue(Int(UIInterfaceOrientation.portrait.rawValue), forKey: "orientation")
    }
}

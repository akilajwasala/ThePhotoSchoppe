//
//  FullImageViewController.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/31/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit
import SDWebImage

class FullImageViewController: BaseViewController {

    @IBOutlet var imgView: UIImageView!
    var selectedItem: ImageItem?
    var emailButtonClickClosure: ((ImageItem) -> ())?
    var webSiteButtonClickClosure: ((ImageItem) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()

        setImage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.makeOtherViewsOnlyPortrait()
    }
    
    fileprivate func setImage() {
        if let item = selectedItem {
            if let imageUrl = item.media?.m {
                imgView?.sd_setImage(with: URL(string:imageUrl), completed: nil)
            } else {
                imgView.image = #imageLiteral(resourceName: "camera")
            }
        } else {
            imgView.image = #imageLiteral(resourceName: "camera")
        }
    }
    
    @IBAction func btnClickedClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnClickWebView(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.webSiteButtonClickClosure?(self.selectedItem!)
        }
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

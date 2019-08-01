//
//  RoundedView.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/30/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit

class RoundedView: UIView {

    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 8
        
        //shade the view
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowRadius = 6.0
        self.layer.shadowColor = UIColor.black.cgColor
        super.layoutSubviews()
    }
}

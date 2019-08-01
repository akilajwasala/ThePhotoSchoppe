//
//  RoundedButton.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/30/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    @IBInspectable
    var titleText: String? {
        didSet {
            self.setTitle(titleText, for: UIControl.State.normal)
        }
    }
    
    @IBInspectable
    var titleColor: UIColor? {
        didSet {
            self.setTitleColor(titleColor, for: .normal)
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet {
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
        super.layoutSubviews()
    }

}

//
//  ImageCollectionViewCell.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/31/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setObject(item: ImageItem) {
        imgView.image = #imageLiteral(resourceName: "backgroundImage")
    }
}

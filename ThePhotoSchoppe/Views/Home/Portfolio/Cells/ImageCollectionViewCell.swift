//
//  ImageCollectionViewCell.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/31/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit
import SDWebImage

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setObject(item: ImageItem) {
        if let imageUrl = item.media?.m {
            imgView?.sd_setImage(with: URL(string:imageUrl), completed: nil)
        } else {
            imgView.image = #imageLiteral(resourceName: "camera")
        }
        lblDate.text = item.date_taken?.getFormattedStringDate(inputFormat:DateFormats.ServerDateFormat, outputFormat: DateFormats.CommonDateFormat)
    }
}

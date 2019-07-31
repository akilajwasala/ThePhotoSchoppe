//
//  DirectoryTableViewCell.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/31/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit
import SDWebImage

class DirectoryTableViewCell: UITableViewCell {
    
    @IBOutlet var viewBackground: RoundedView!
    @IBOutlet var imgProfile: RoundedImageView!
    @IBOutlet var lblFirstName: UILabel!
    @IBOutlet var lblSurname: UILabel!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var lblPhoneNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewBackground.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setObject(photographer: Photographer) {
        imgProfile.image    = UIImage(named: photographer.imgUrl ?? "")
        lblFirstName.text   = photographer.firstName
        lblSurname.text     = photographer.surname
        lblPhoneNumber.text = photographer.phoneNumber
        lblEmail.text       = photographer.email
        
        if let imageUrl = photographer.imgUrl {
            imgProfile?.sd_setImage(with: URL(string:imageUrl), completed: nil)
        } else {
            imgProfile.image = #imageLiteral(resourceName: "navBar")
        }
    }
    
}

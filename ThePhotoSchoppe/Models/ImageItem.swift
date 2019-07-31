//
//  ImageItem.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 8/1/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import Foundation

class Feed: Codable {
    var items: [ImageItem]?
}

class ImageItem: Codable {
    var date_taken: String?
    var link: String?
    var media: Media?
}

class Media: Codable {
    var m: String?
}

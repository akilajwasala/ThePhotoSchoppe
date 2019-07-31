//
//  Constants.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/30/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import Foundation

public struct URLProvider {
    public static let PHOTO_FEED_API_URL = "https://www.flickr.com/services/feeds/photos_public.gne?format=json"
    
    public static func getHeaders() -> Dictionary<String, String>{
        return ["Content-Type":"application/json"]
    }
}

public struct ReuseIdentifiers {
    public static let DirectoryTableViewCell = "DirectoryTableViewCell"
    public static let ImageCollectionViewCell = "ImageCollectionViewCell"
}

public struct NibName {

}

public struct NamedSegues {
    public static let SegueRegToHome = "SegueRegToHome"
    public static let SegueMoreToMap = "SegueMoreToMap"
    public static let SeguePortfolioToFullImage = "SeguePortfolioToFullImage"
    public static let SeguePortfolioToWebView = "SeguePortfolioToWebView"
}

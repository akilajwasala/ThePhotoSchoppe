//
//  Constants.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/30/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import Foundation

public struct URLProvider {
    public static let BASE_URL_WEB = "https://www.flickr.com/"
    public static let BASE_URL = "https://api.flickr.com"
    public static let UserID = "118991715%40N06"
    
    public static func getHeaders() -> Dictionary<String, String>{
        return ["Content-Type":"application/json"]
    }
    
    public static func getUserPosts() -> String {
        return "\(BASE_URL)/services/feeds/photos_public.gne?format=json&nojsoncallback=1&id=\(UserID)"
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

public struct DymmyTexts {
    public static let AppName = "The Photo Shoppe"
    public static let ContactPhoneNumber = "0110358144"
    public static let ContactEmailAddress = "hello@IronOne.com"
    public static let EmailSubject = "Inquiry for the Photo Schoppe"
}

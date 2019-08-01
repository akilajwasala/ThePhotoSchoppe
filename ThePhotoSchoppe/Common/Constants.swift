//
//  Constants.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/30/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import Foundation
import UIKit

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

public struct NamedSegues {
    public static let SegueRegToHome = "SegueRegToHome"
    public static let SegueMoreToMap = "SegueMoreToMap"
    public static let SeguePortfolioToFullImage = "SeguePortfolioToFullImage"
    public static let SeguePortfolioToWebView = "SeguePortfolioToWebView"
}

public struct Strings {
    public static let SUCCESS = "Success"
    public static let REG_SUCCESS = "Registered Successfully"
    public static let ERROR = "Error"
    public static let ERROR_INVALID_USERNAME = "Atleast three letters need for an username"
    public static let ERROR_INVALID_PASSWORD = "Atleast five letters need for a valid password"
    public static let ERROR_INVALID_EMAIL = "Not a valid email address"
    public static let ERROR_NO_EMAIL_BOX = "You have not configured the email box for this iphone"
    public static let ERROR_NO_IMAGE_URL = "Image URL is missing"
    public static let ERROR_API = "Invalid Request or Something Wrong"
    public static let OK = "OK"
    public static let CANCEL = "CANCEL"
    public static let EMAIL_REGEX = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
    public static let MIME_TYPE_JPEG = "image/jpeg"
}

public struct DummyTexts {
    public static let AppName = "The Photo Shoppe"
    public static let LocationSubtitle = "Colombo 00200"
    public static let ContactPhoneNumber = "0110358144"
    public static let ContactEmailAddress = "hello@IronOne.com"
    public static let EmailSubject = "Inquiry for the Photo Schoppe"
}

public struct DateFormats {
    public static let ServerDateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    public static let CommonDateFormat = "dd MMM YYYY"
}

public struct StatusCode {
    public static let STATUS_OK = 200
}

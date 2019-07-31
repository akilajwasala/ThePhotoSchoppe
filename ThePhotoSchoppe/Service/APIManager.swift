//
//  APIManager.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/31/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    func getPhotoList(delegate: @escaping ([ImageItem], Bool) -> ()) {
        
        Alamofire.request(URLProvider.PHOTO_FEED_API_URL, method: .get, headers: URLProvider.getHeaders()).responseJSON { response in

            if response.response?.statusCode == 200 {
                if let imageArray = try? response.deserialize([ImageItem].self) {
                    delegate(imageArray, true)
                } else {
                    delegate([],false)
                }
            } else {
                delegate([],false)
            }
        }
        
    }
    
}

class ImageItem: Codable {
    var date_taken: String?
    var link: String?
    //var uiimage: UIImage?
    
//    init(date: String, link: String, image: UIImage) {
//        self.date_taken = date
//        self.link = link
//        self.uiimage = image
//    }
}

//Can use seperate file for all extentions
extension DataResponse {
    
    func deserialize<T>(_ type: T.Type) throws -> T where T: Decodable {
        return try JSONDecoder().decode(type, from: self.data!)
    }
    
}

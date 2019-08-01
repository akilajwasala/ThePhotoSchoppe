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
        
        Alamofire.request(URLProvider.getUserPosts(), method: .get, headers: URLProvider.getHeaders()).responseJSON { response in

            if response.response?.statusCode == StatusCode.STATUS_OK {
                if let feed = try? response.deserialize(Feed.self) {
                    delegate(feed.items ?? [], true)
                } else {
                    delegate([],false)
                }
            } else {
                delegate([],false)
            }
        }
        
    }
    
}

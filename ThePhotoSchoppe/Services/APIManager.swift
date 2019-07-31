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

            if response.response?.statusCode == 200 {
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

//Can use seperate file for all extentions
extension DataResponse {
    
    func deserialize<T>(_ type: T.Type) throws -> T where T: Decodable {
        return try JSONDecoder().decode(type, from: self.data!)
    }
    
}

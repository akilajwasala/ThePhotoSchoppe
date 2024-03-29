//
//  PortfolioViewModel.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/31/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit

internal protocol UIGetPortfolioDelegate {
    func onGetPortfolioSuccess(items: [ImageItem])
    func onGetPortfolioFailed(reason: String)
}

class PortfolioViewModel: NSObject {

    private let apiManager = APIManager()

    internal func getPortfolio(callback: UIGetPortfolioDelegate) {
        
        apiManager.getPhotoList { (imageItems, isSuccess) in
            if isSuccess {
                //Best way is to get only 10 objects but couldn't find the parameter need to pass the item count
                callback.onGetPortfolioSuccess(items: Array(imageItems.prefix(10)))
            } else {
                callback.onGetPortfolioFailed(reason: Strings.ERROR_API)
            }
        }
    }

}

//
//  DirectoryViewModel.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/31/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit

internal protocol UIGetDirectoryDelegate {
    func onGetDirectorySuccess(photographers: [Photographer])
    func onGetDirectoryFailed(reason: String)
}

class DirectoryViewModel {

    internal func getAllPhotographers(callback: UIGetDirectoryDelegate) {
        callback.onGetDirectorySuccess(photographers: getDirectory().sorted(by: { $0.surname < $1.surname }))
    }
    
    func getDirectory() -> [Photographer] {
        let url = Bundle.main.url(forResource: "Directory", withExtension: "plist")!
        let data = try! Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        return try! decoder.decode([Photographer].self, from: data)
    }

}

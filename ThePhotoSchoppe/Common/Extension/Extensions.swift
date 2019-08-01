//
//  Extensions.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/30/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import Foundation
import UIKit
import PopupDialog
import Alamofire

extension String {
    
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: Strings.EMAIL_REGEX, options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }

    func getFormattedStringDate(inputFormat: String, outputFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        let date = dateFormatter.date(from: self)
        guard let dateO = date else {
            return ""
        }
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = outputFormat
        return outputDateFormatter.string(from: dateO)
    }
}

extension UIViewController {
    
    func showMessage(isError: Bool, title: String, message: String, completion: @escaping ()->()) {
        let title = title
        let message = message
        let popup = PopupDialog(title: title, message: message, image: nil)
        let button = CancelButton(title: (isError ? Strings.CANCEL : Strings.OK)) {
            completion()
        }
        popup.addButtons([button])
        self.present(popup, animated: true, completion: nil)
    }
}

extension DataResponse {
    
    func deserialize<T>(_ type: T.Type) throws -> T where T: Decodable {
        return try JSONDecoder().decode(type, from: self.data!)
    }
    
}

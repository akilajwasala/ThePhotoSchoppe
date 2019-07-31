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

extension String {
    
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
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
        let button = CancelButton(title: (isError ? "Cancel" : "Ok")) {
            completion()
        }
        popup.addButtons([button])
        self.present(popup, animated: true, completion: nil)
    }
}

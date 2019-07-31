//
//  WebViewController.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/31/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: BaseViewController {

    @IBOutlet var webView: WKWebView!
    var selectedItem: ImageItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = selectedItem?.link {
            sendRequest(urlString: url)
        } else {
            sendRequest(urlString: URLProvider.BASE_URL)
        }
    }

    // Convert String into URL and load the URL
    private func sendRequest(urlString: String) {
        let myURL = URL(string: urlString)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

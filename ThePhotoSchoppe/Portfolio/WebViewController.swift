//
//  WebViewController.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/31/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    let sampleURL = "https://www.flickr.com/"

    override func viewDidLoad() {
        super.viewDidLoad()

        sendRequest(urlString: sampleURL)
    }

    // Convert String into URL and load the URL
    private func sendRequest(urlString: String) {
        let myURL = URL(string: urlString)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

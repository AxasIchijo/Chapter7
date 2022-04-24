//
//  WebViewController.swift
//  Chapter7
//
//  Created by AXLT0221-AP on 2022/04/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var itemUrl: String?

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let itemUrl = itemUrl else {
            return
        }
        
        guard let url = URL(string: itemUrl) else {
            return
        }
        
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
}

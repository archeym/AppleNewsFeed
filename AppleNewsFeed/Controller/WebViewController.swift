//
//  WebViewController.swift
//  AppleNewsFeed
//
//  Created by Arkadijs Makarenko on 10/05/2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var urlString: String = String()
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Web"
        guard let url = URL(string: urlString) else {return}
        
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start nav")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("stop nav")
    }

}

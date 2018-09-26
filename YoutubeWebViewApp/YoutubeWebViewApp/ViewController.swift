//
//  ViewController.swift
//  YoutubeWebViewApp
//
//  Created by Arman Husic on 9/25/18.
//  Copyright © 2018 Arman Husic. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate   {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        webView.navigationDelegate = self
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let urlString: String = "https://www.youtube.com"
        let url:URL = URL(string: urlString)!
        let urlRequest: URLRequest = URLRequest(url: url)
       
        webView.load(urlRequest)
        searchBar.text = urlString
    }
    
        //expecting boolean
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //takes url from the search bar
        let urlString:String = searchBar.text!
        //create url object from query
        let url:URL = URL(string: urlString)!
        //create a url request
        let urlRequest:URLRequest = URLRequest(url: url)
        //load the request into webView
        webView.load(urlRequest)
        //dismiss keyboard
        searchBar.resignFirstResponder()
        

        return true
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forwardButtonPressed(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
        //check if webView is done loading and enable buttons
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        //enable back button when webview loads
        backButton.isEnabled = webView.canGoBack
        //enable forward button when webView loads
        forwardButton.isEnabled = webView.canGoForward
        //update the url text field in the searchbar when loading is done
        searchBar.text = webView.url?.absoluteString
    }
    
    
    
}


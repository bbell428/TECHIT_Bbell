//
//  ViewController.swift
//  Network_ErrorHandling
//
//  Created by 김동경 on 2024/07/12.
//

import UIKit
import WebKit


enum GettingHTMLError: Error {
    case urlError
    case urlSeesionError
}

class ViewController: UIViewController, WKNavigationDelegate {

    
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.navigationDelegate = self
        
    }

    @IBAction func jongHuk(_ sender: Any) {
        let urlString: String = "https://github.com/bbell428?tab=repositories"
        if let url: URL = URL(string: urlString) {
            let urlRequest: URLRequest = URLRequest(url: url)
            
            myWebView.load(urlRequest)
        }
    }
    
    @IBAction func jungone(_ sender: Any) {
        let urlString: String = "https://github.com/gadisom"
        if let url: URL = URL(string: urlString) {
            let urlRequest: URLRequest = URLRequest(url: url)
            
            myWebView.load(urlRequest)
        }
        
    }
    
    @IBAction func dongkyung(_ sender: Any) {
        
        let urlString: String = "https://github.com/dongykung"
        if let url: URL = URL(string: urlString) {
            let urlRequest: URLRequest = URLRequest(url: url)
            
            myWebView.load(urlRequest)
        }
    }
    
    @IBAction func jungmin(_ sender: Any) {
        
        let urlString: String = "https://github.com/Jeolmi123"
        if let url: URL = URL(string: urlString) {
            let urlRequest: URLRequest = URLRequest(url: url)
            
            myWebView.load(urlRequest)
        }
    }
    
    
    
    func requestHTML(from urlString: String) async throws -> Data {
       
        guard let url = URL(string: urlString) else {
            throw GettingHTMLError.urlError
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw GettingHTMLError.urlSeesionError
        }
    }
    
    
    
    // MARK: - WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("읽기 시작")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("읽어오기 완료")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
        print("\(error.localizedDescription)")
    }
    
}


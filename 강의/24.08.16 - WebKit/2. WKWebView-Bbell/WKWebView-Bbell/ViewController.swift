//
//  ViewController.swift
//  WKWebView-Bbell
//
//  Created by 김종혁 on 8/16/24.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    let webDictionary: [String: String] = ["김종혁1": "https://www.google.com/", "김종혁2": "https://www.naver.com/", "김종혁3": "https://github.com/"]
    
    func userWebBtn(_ user: String) -> UIButton {
        let userWebBtn: UIButton = UIButton()
        userWebBtn.backgroundColor = UIColor(red: 185/255, green: 136/255, blue: 188/255, alpha: 1)
        userWebBtn.setTitle(user, for: .normal)
        return userWebBtn
    }
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        return webView
    }()
    
    private lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(systemName: "arrowshape.backward.fill"), for: .normal)
        
        let action = UIAction(handler: { action in
            self.webView.goBack()
        })
        backButton.tintColor = .green
        
        backButton.addAction(action, for: .touchUpInside)
        return backButton
    }()
    
    private lazy var forwardButton: UIButton = {
        let forwardButton = UIButton()
        forwardButton.setImage(UIImage(systemName: "arrowshape.forward.fill"), for: .normal)
        
        let action = UIAction(handler: { action in
            self.webView.goForward()
        })
        forwardButton.tintColor = .green
        
        forwardButton.addAction(action, for: .touchUpInside)
        return forwardButton
    }()
    
    private lazy var reloadButton: UIButton = {
        let reloadButton = UIButton()
        reloadButton.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        
        let action = UIAction(handler: { action in
            self.webView.reload()
        })
        reloadButton.tintColor = .green
        
        reloadButton.addAction(action, for: .touchUpInside)
        return reloadButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        let myURL = URL(string:"https://www.google.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupInterface()
    }
    
    func setupInterface() {
        // 수직 스택
        let stackView = UIStackView()
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        // 바텀 스택
        let bottomStackViewHorizontal = UIStackView()
        bottomStackViewHorizontal.axis = .horizontal
        bottomStackViewHorizontal.distribution = .fillEqually
        
        // 탑 스택
        let topStackViewHorizontal = UIStackView()
        topStackViewHorizontal.distribution = .fillEqually
        
        // MARK - 화면전환 버튼 반복문
        for (index, key) in webDictionary.keys.sorted().enumerated() {
            let userWebBtn = userWebBtn(key)
            
            userWebBtn.tag = index
            userWebBtn.translatesAutoresizingMaskIntoConstraints = false
            
            userWebBtn.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
            
            topStackViewHorizontal.addArrangedSubview(userWebBtn)
        }
        
        stackView.addArrangedSubview(topStackViewHorizontal)
        stackView.addArrangedSubview(webView)
        stackView.addArrangedSubview(bottomStackViewHorizontal)
        
        bottomStackViewHorizontal.addArrangedSubview(backButton)
        bottomStackViewHorizontal.addArrangedSubview(forwardButton)
        bottomStackViewHorizontal.addArrangedSubview(reloadButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackViewHorizontal.translatesAutoresizingMaskIntoConstraints = false
        
        let safeLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            webView.widthAnchor.constraint(equalTo: safeLayoutGuide.widthAnchor),
            webView.heightAnchor.constraint(equalTo: safeLayoutGuide.heightAnchor, constant: -80),
            
            stackView.centerXAnchor.constraint(equalTo: safeLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeLayoutGuide.centerYAnchor),
            
            bottomStackViewHorizontal.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // MARK: - WKNavigationDelegate
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("로딩 완료")
        
        let script = """
            document.body.style.backgroundColor = 'pink'
        """
        
        webView.evaluateJavaScript(script) { (result, error) in
            if let error {
                print("Error: \(error.localizedDescription)")
                return
            }
        }
    }
    
    // 화면 전환 버튼 클릭 시 작동
    @objc func clickButton(_ sender: UIButton) {
        let keys = webDictionary.keys.sorted() // [김종혁1, 김종혁2, 김종혁3]
        let urlString = webDictionary[keys[sender.tag]]
        
        let myURL = URL(string: urlString ?? "")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}




#Preview {
    ViewController()
}



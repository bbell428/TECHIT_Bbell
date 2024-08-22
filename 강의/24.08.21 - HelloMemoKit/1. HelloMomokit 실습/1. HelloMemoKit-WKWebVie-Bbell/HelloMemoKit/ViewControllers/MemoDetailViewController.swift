
import UIKit
import WebKit

class MemoDetailViewController: BaseViewController {
    
    var memo: Memo?
    
    // 웹뷰
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Memo Detail"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        webView.loadHTMLString("""
        <html>
            <head>
                <title>메모장</title>
                <style>
                    body {
                        background-color: #f0f8ff; /* 부드러운 파란색 배경 */
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* 세련된 기본 폰트 */
                        margin: 0;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        height: 100vh;
                    }
        
                    .container {
                        background-color: #ffffff; /* 흰색 배경 */
                        padding: 40px;
                        border-radius: 15px;
                        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 효과 */
                        text-align: center;
                        max-width: 600px;
                        width: 90%;
                    }
        
                    h1 {
                        color: #34495e; /* 진한 파란색 텍스트 */
                        font-size: 2.5em; /* 큰 폰트 크기 */
                        margin-bottom: 20px;
                    }
        
                    .date {
                        color: #7f8c8d; /* 중간 회색 텍스트 */
                        font-size: 1.2em; /* 약간 작은 폰트 크기 */
                        margin-top: 10px;
                    }
                    
                </style>
            </head>
            <body>
                <div class="container">
                    <h1>디데일한 나의 메모</h1>
                    <h1>\(memo?.text ?? "")</h1>
                    <div class="date">\(memo?.createdAtString ?? "")</div>
                </div>
            </body>
        </html>
        
        """, baseURL: nil)
        
    }
    
    
    
    override func setupInterface() {
        super.setupInterface()
        
        view.addSubview(webView)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
}

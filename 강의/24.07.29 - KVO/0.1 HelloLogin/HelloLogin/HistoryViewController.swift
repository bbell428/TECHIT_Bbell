//
//  HistoryViewController.swift
//  HelloLogin
//
//  Created by Jongwook Park on 7/29/24.
//

import UIKit

class HistoryViewController: UIViewController {

//    private var loginModel: LoginModel = LoginModel()
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func displayStatus() {
        // Singleton에 의한 데이터이기 때문에
        // FavoriteViewController에서 변경된 내용을 반영할 수 있다.
        messageLabel.text = "user: \(LoginModel.shared.name)"
    }
    
    @IBAction func getUserName(_ sender: Any) {
        displayStatus()
    }
    
}

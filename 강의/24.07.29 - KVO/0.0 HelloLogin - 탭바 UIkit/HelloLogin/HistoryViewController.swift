//
//  HistoryViewController.swift
//  HelloLogin
//
//  Created by Jongwook Park on 7/29/24.
//

import UIKit

class HistoryViewController: UIViewController {

    private var loginModel: LoginModel = LoginModel()
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStatus()
    }
    
    func displayStatus() {
        messageLabel.text = "user: \(loginModel.name)"
    }
    
    @IBAction func getUserName(_ sender: Any) {
        displayStatus()
    }
    
}

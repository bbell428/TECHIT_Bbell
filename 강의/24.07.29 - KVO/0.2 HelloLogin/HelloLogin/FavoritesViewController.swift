//
//  FavoritesViewController.swift
//  HelloLogin
//
//  Created by Jongwook Park on 7/29/24.
//

import UIKit

class FavoritesViewController: UIViewController {

//    private var loginModel: LoginModel = LoginModel()
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStatus()
    }
    
    func displayStatus() {
        // 이 앱에서 딱 하나만 존재할 LoginModel의 싱글톤 데이터값인 shared를 사용해보자!
        messageLabel.text = "user: \(LoginModel.shared.name)"
    }
    
    @IBAction func login(_ sender: Any) {
        LoginModel.shared.name = "Ned"
        displayStatus()
    }
    
    @IBAction func logout(_ sender: Any) {
        LoginModel.shared.name = "(none)"
        displayStatus()
    }
}

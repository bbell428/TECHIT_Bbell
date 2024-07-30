//
//  FavoritesViewController.swift
//  HelloLogin
//
//  Created by Jongwook Park on 7/29/24.
//

import UIKit

class FavoritesViewController: UIViewController {

    private var loginModel: LoginModel = LoginModel()
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStatus()
    }
    
    func displayStatus() {
        messageLabel.text = "user: \(loginModel.name)"
    }
    
    @IBAction func changeName(_ sender: Any) {
        loginModel.name = "Ned"
        displayStatus()
    }
    
}

//
//  MemberViewController.swift
//  CountryWannaGo
//
//  Created by 홍재민 on 7/30/24.
//

import UIKit

class MemberSelectViewController: UIViewController {
    
    private let memberManager: MemberManager = MemberManager.instance
    private let firstButtonTag: Int = 100
    
    @IBOutlet weak var selectedMemberNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        memberManager.addObserver(self, forKeyPath: #keyPath(MemberManager.selectedMemberIndex), options: [.initial, .new], context: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        memberManager.removeObserver(self, forKeyPath: #keyPath(MemberManager.selectedMemberIndex))
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(MemberManager.selectedMemberIndex) {
            setSelectedMemberNameLabel()
        }
    }
    
    @IBAction func onPressMemberButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        memberManager.setMember(button.tag - firstButtonTag)
    }
    

    private func setSelectedMemberNameLabel() {
        guard let selectedMember = memberManager.selectedMember else {
            selectedMemberNameLabel.text = ""
            return
        }
        
        selectedMemberNameLabel.text = selectedMember.name
    }
}

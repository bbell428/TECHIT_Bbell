//
//  MemberTableViewController.swift
//  CountryWannaGo
//
//  Created by 홍재민 on 7/30/24.
//

import UIKit

class MemberTableViewController: UITableViewController {

    let numberOfSections: Int = 1
    let memberManager: MemberManager = MemberManager.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearsSelectionOnViewWillAppear = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memberManager.memberCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = memberManager.getMember(indexPath.row).name
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        memberManager.setMember(indexPath.row)
    }
}

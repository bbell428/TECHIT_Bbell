//
//  MoviesTableViewController.swift
//  HelloMovie
//
//  Created by Jongwook Park on 8/13/24.
//

import UIKit

class MoviesTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Movies"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

}

//
//  MoviesTableViewController.swift
//  HelloMovie
//
//  Created by Jongwook Park on 8/13/24.
//

import UIKit

class MoviesTableViewController: BaseTableViewController {

    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func updateMovies(_ publisher: Publisher) {
        title = publisher.rawValue
        movies = MovieStore.shared.movies.filter { $0.publisher == publisher }.sorted { $0.year > $1.year }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "MyCell")

        let movie = movies[indexPath.row]
        
        cell.textLabel?.text = "\(movie.name)"
        cell.detailTextLabel?.text = "\(movie.year)"

        return cell
    }
}

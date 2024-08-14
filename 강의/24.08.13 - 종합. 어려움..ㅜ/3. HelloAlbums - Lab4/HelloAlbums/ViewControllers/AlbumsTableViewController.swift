//
//  AlbumsTableViewController.swift
//  HelloAlbums
//
//  Created by 김종혁 on 8/13/24.
//

import UIKit
import SafariServices

class AlbumsTableViewController: BaseTableViewController {

    var albums: [Album] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블뷰의 cell을 재활용해서 메모리 효율성과 성능향상을 기대할 수 있다
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
    }
    
    public func updateMovies(_ publisher: Publisher) {
        title = publisher.rawValue
        albums = AlbumStore.shared.albums.filter { $0.publisher == publisher }.sorted { $0.name > $1.name }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "MyCell")
        
        let album = albums[indexPath.row]
        
        cell.textLabel?.text = "\(album.name)"
//        cell.detailTextLabel?.text = "\(movie.year)"
        
        if let urlString = album.posterURL {
            Task {
                do {
                    // 비동기적으로 이미지 가져오기
                    let image: UIImage = try await UIImage.fetchImage(from: urlString)
                    
                    DispatchQueue.main.async {
                        // 셀 이미지 업데이트
                        cell.imageView?.image = image
                        cell.setNeedsLayout() // 레이아웃 업데이트 요청
                    }
                } catch {
                    // 오류 발생 시 기본 이미지로 업데이트
                    DispatchQueue.main.async {
                        cell.imageView?.image = UIImage(systemName: "film")
                    }
                }
            }
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = albums[indexPath.row]
        
        if let url = URL(string: album.infoURL ?? "") {
            let viewController = SFSafariViewController(url: url)
            
            // navigationController?.pushViewController(viewController, animated: true)
            
            viewController.modalPresentationStyle = .pageSheet
            self.present(viewController, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

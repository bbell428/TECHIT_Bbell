//
//  ViewController.swift
//  collect
//
//  Created by 김정원 on 8/19/24.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var filteredProducts: [Product] = []
    let allProducts: [Product] = products
    
    lazy var filterSegmentedControl: UISegmentedControl = {
            let control = UISegmentedControl(items: ["All", "정원", "수민", "범규", "인영", "영진"])
            control.selectedSegmentIndex = 0
            control.addTarget(self, action: #selector(filterChanged(_:)), for: .valueChanged)
            return control
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "상품 목록"
        view.backgroundColor = .white
        filteredProducts = allProducts
        
        filterSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(filterSegmentedControl)
        view.addSubview(collectionView)
        layout()
        
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            filterSegmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            filterSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            filterSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.topAnchor.constraint(equalTo: filterSegmentedControl.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let product = filteredProducts[indexPath.item] // filteredProducts 사용
        cell.configure(with: product)
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 15, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = filteredProducts[indexPath.item]
        
        if let url = URL(string: product.infoURL) {
            let safariVC = SFSafariViewController(url: url)
            safariVC.modalPresentationStyle = .pageSheet // 모달로 띄우기 (스타일 선택 가능)
            present(safariVC, animated: true, completion: nil)
        }
    }
    
    @objc func filterChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            filteredProducts = allProducts.filter { $0.person == .jw }
        case 2:
            filteredProducts = allProducts.filter { $0.person == .sm }
        case 3:
            filteredProducts = allProducts.filter { $0.person == .bg }
        case 4:
            filteredProducts = allProducts.filter { $0.person == .iy }
        case 5:
            filteredProducts = allProducts.filter { $0.person == .yj }
        default:
            filteredProducts = allProducts
        }
        
        collectionView.reloadData()
    }
}

#Preview {
    ViewController()
}

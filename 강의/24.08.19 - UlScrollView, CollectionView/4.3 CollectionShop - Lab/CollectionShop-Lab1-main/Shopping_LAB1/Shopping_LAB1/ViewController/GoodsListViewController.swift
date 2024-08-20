//
//  GoodsListViewController.swift
//  Shopping_LAB1
//
//  Created by Hyunwoo Shin on 8/19/24.
//

import UIKit
import SafariServices

class GoodsListViewController: UIViewController, SFSafariViewControllerDelegate {
    private let goodsManager = GoodsManager()
    private var goodsWithFilter: [Goods] = []
    
    private lazy var hStackView: UIStackView = {
       let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 120, height: 160)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .black
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: "MyCell")
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        switchArray(discriminator: "All")
        
        setUI()
    }
    
    func setUI() {
        let button = UIButton()
        
        button.setTitle("All", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.addAction(UIAction { _ in
            self.switchArray(discriminator: "All")
        }, for: .touchUpInside)
        
        hStackView.addArrangedSubview(button)
        
        for (_, value) in goodsManager.members.enumerated() {
            let button = UIButton()
            
            button.setTitle(value.memberName, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.white.cgColor
            
            button.addAction(UIAction { _ in
                self.switchArray(discriminator: value.memberName)
            }, for: .touchUpInside)
            
            hStackView.addArrangedSubview(button)
        }
        
        view.addSubview(hStackView)
        view.addSubview(collectionView)
        
        let safeGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            hStackView.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            hStackView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            hStackView.widthAnchor.constraint(equalTo: safeGuide.widthAnchor),
            hStackView.heightAnchor.constraint(equalToConstant: 50),
            
            collectionView.widthAnchor.constraint(equalTo: safeGuide.widthAnchor),
            collectionView.centerXAnchor.constraint(equalTo: safeGuide.centerXAnchor),
            collectionView.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 80),
            collectionView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor, constant: -60),
        ])
    }
    
    func switchArray(discriminator: String) {
        goodsWithFilter = []
        
        switch discriminator {
        case "김동경":
            goodsWithFilter = goodsManager.members.filter { $0.memberName == "김동경" }.flatMap { $0.goodsList }
        case "신현우":
            goodsWithFilter = goodsManager.members.filter { $0.memberName == "신현우" }.flatMap { $0.goodsList }
        case "이주노":
            goodsWithFilter = goodsManager.members.filter { $0.memberName == "이주노" }.flatMap { $0.goodsList }
        case "홍재민":
            goodsWithFilter = goodsManager.members.filter { $0.memberName == "홍재민" }.flatMap { $0.goodsList }
        default:
            for member in goodsManager.members {
                goodsWithFilter += member.goodsList
            }
        }
        
        collectionView.reloadData()
    }
}

extension GoodsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goodsWithFilter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        
        Task {
            do {
                let image = try await UIImage.fetchImage(from: goodsWithFilter[indexPath.row].goodsImage)
                
                DispatchQueue.main.async {
                    cell.button.setImage(image, for: .normal)
                    cell.button.addAction(UIAction { _ in
                        let sFSafariViewController = SFSafariViewController(url: URL(string: self.goodsWithFilter[indexPath.row].goodsSite)!)
                        
                        sFSafariViewController.delegate = self
                        sFSafariViewController.modalPresentationStyle = .formSheet
                        self.present(sFSafariViewController, animated: true, completion: nil)
                        
                    }, for: .touchUpInside)
                    cell.setNeedsLayout()
                }
                
            } catch {
                DispatchQueue.main.async {
                    cell.button.setImage(UIImage(systemName: "bag.circle"), for: .normal)
                    cell.setNeedsLayout()
                }
            }
        }
        
        cell.nameLabel.text = goodsWithFilter[indexPath.row].goodsName
        
        return cell
    }
}

#Preview {
    GoodsListViewController()
}

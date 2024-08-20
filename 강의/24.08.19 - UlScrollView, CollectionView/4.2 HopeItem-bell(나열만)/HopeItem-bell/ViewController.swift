//
//  ViewController.swift
//  HopeItem-bell
//
//  Created by 김종혁 on 8/19/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private lazy var collectionView: UICollectionView = {
        // UICollectionView의 레이아웃 설정
        let layout = UICollectionViewFlowLayout()
        
        // Cell의 크기와 간격 조정
        layout.itemSize = CGSize(width: 120, height: 140)
        layout.minimumLineSpacing = 10 // 줄 간격
        layout.minimumInteritemSpacing = 10 // 셀 간격
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .lightGray
        
        // 재활용 가능한 custom cell 선언
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: "MyCell")
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupInterface()
    }
    
    func setupInterface() {
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor)
        ])
    }
    
    // MARK: - UICollectionViewDelegate
    
    
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // cell의 재활용
        let cell: MyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        
        let datas = data[indexPath.row]
        
        if let urlString = datas.url {
            Task {
                do {
                    // 비동기적으로 이미지 가져오기
                    let image: UIImage = try await UIImage.fetchImage(from: urlString)
                    
                    DispatchQueue.main.async {
                        // 셀 이미지 업데이트
                        cell.imageView.image = image
                        cell.setNeedsLayout() // 레이아웃 업데이트 요청
                    }
                } catch {
                    // 오류 발생 시 기본 이미지로 업데이트
                    DispatchQueue.main.async {
                        cell.imageView.image = UIImage(systemName: "film")
                    }
                }
            }
        }
        
        return cell
    }
}

class MyCell: UICollectionViewCell {
    let imageView: UIImageView
    
    override init(frame: CGRect) {
        
        imageView = UIImageView()
        
        super.init(frame: frame)
        
        imageView.frame = contentView.bounds
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        
        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    ViewController()
}

//
//  CollectionViewCell.swift
//  collect
//
//  Created by 김정원 on 8/19/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true // 텍스트가 라벨에 맞도록 크기 조정
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with product: Product) {
        imageView.image = nil
        nameLabel.text = product.name

        if let imageURL = product.imageURL, !imageURL.isEmpty {
            // URL이 있는 경우 이미지 로딩
            if let url = URL(string: imageURL) {
                let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                    guard let self = self else { return }
                    if let data = data, error == nil {
                        DispatchQueue.main.async {
                            self.imageView.image = UIImage(data: data)
                        }
                    } else {
                        // 에러 처리 또는 기본 이미지 설정
                        DispatchQueue.main.async {
                            self.imageView.image = UIImage(systemName: "tray")
                        }
                    }
                }
                task.resume()
            }
        } else if let imageName = product.imageName {
            // URL이 없고 imageName이 있는 경우 로컬 이미지 사용
            imageView.image = UIImage(named: imageName)
        } else {
            // URL과 imageName이 모두 없는 경우 기본 이미지 설정
            imageView.image = UIImage(systemName: "tray")
        }
    }
}

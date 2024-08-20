//
//  MyCell.swift
//  Shopping_LAB1
//
//  Created by Hyunwoo Shin on 8/19/24.
//

import Foundation
import UIKit

class MyCell: UICollectionViewCell {
    var vStackView: UIStackView
    let button: UIButton
    var nameLabel: UILabel
    
    override init(frame: CGRect) {
        vStackView = UIStackView()
        button = UIButton()
        nameLabel = UILabel()
        
        super.init(frame: frame)
        
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        vStackView.addArrangedSubview(button)
        vStackView.addArrangedSubview(nameLabel)
        vStackView.axis = .vertical
        vStackView.spacing = 5
        vStackView.distribution = .equalSpacing
        vStackView.layer.cornerRadius = 10
        vStackView.layer.borderColor = UIColor.white.cgColor
        vStackView.layer.borderWidth = 2
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(vStackView)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 120),
            button.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

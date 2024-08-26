//
//  MemoCell.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

// 커스텀 셀 만들기
class MemoCell: UITableViewCell {
    
    public lazy var sideView: UIView = {
        let view = UIView()
        return view
    }()
    
    public lazy var memoTextLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var memoCreatedAtLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .footnote)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var outStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        
        return stackView
    }()
    
    private lazy var inStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(outStackView)
        
        outStackView.addArrangedSubview(sideView)
        outStackView.addArrangedSubview(inStackView)
        
        inStackView.addArrangedSubview(memoTextLabel)
        inStackView.addArrangedSubview(memoCreatedAtLabel)
        
        outStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            outStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            outStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            outStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            outStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            sideView.widthAnchor.constraint(equalToConstant: 5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

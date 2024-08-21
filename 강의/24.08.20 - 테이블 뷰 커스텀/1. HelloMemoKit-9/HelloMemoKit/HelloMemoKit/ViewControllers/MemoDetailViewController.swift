//
//  MemoDetailViewController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

class MemoDetailViewController: BaseViewController {
    
    var memo: Memo?
  
    private lazy var memoTextView: UITextView = {
        let textView = UITextView()
        textView.font = .preferredFont(forTextStyle: .largeTitle)
        textView.isEditable = false
        return textView
    }()
    
    private lazy var memoTextLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 15
        return label
    }()
    
    private lazy var memoCreatedAtLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Memo Detail"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        memoTextView.text = memo?.text ?? ""
        memoTextLabel.text = memo?.text ?? ""
        memoCreatedAtLabel.text = memo?.createdAtString ?? ""
    }


    override func setupInterface() {
        super.setupInterface()
        
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(memoTextView)
        stackView.addArrangedSubview(memoTextLabel)
        stackView.addArrangedSubview(memoCreatedAtLabel)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
}

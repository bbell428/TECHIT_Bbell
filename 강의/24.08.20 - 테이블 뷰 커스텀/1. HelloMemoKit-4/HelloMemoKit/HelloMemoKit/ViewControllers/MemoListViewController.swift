//
//  MemoListViewController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

class MemoListViewController: BaseViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5.0
        return stackView
    }()
    
    private lazy var memoTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemYellow
        return tableView
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        button.setTitle(" Add a memo ", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.backgroundColor = .systemTeal
        
        button.addAction(UIAction { _ in
            print("Hello")
        }, for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func setupInterface() {
        super.setupInterface()
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(memoTableView)
        stackView.addArrangedSubview(addButton)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

#Preview {
    MemoListViewController()
}

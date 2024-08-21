//
//  MemoListViewController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

class MemoListViewController: BaseViewController, UITableViewDataSource {
    
    private let memoStore: MemoStore = MemoStore.shared
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5.0
        return stackView
    }()
    
    private lazy var memoTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemYellow
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MemoCell")
        
        return tableView
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
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
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath)
        cell.textLabel?.text = "Hello World"
        return cell
    }
}

#Preview {
    MemoListViewController()
}

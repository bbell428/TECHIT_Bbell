

import UIKit

class MemoListViewController: BaseViewController {
    
    let manager: MemoStore = MemoStore.shared
    
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
        
        memoTableView.delegate = self
        memoTableView.dataSource = self
        
        memoTableView.frame = view.bounds
        
        memoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

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

extension MemoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 몇개의 섹션이 있는지 정의하는 함수?
    func numberOfSections(in tableView: UITableView) -> Int {
        return manager.memoList.count
    }
    
    // 각 섹션의 제목을 정의하는 함수
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(manager.memoList[section].displayDate)"
    }

    // 각 섹션에 몇 개의 아이템이 있는지 정의하는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // 각 섹션별 아이템 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = manager.memoList[indexPath.section].text
        cell.backgroundColor = .yellow
        
        return cell
    }
}

#Preview {
    MemoListViewController()
}

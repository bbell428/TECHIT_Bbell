

import UIKit

class MemoListViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let memoStore: MemoStore = MemoStore.shared
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5.0
        return stackView
    }()
    
    private lazy var memoTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.dataSource = self
        tableView.delegate = self
        
        // 메모리의 효율적 관리를 위해
        // TableView가 사용할 Cell의 재활용 선언
        tableView.register(MemoCell.self, forCellReuseIdentifier: "MemoCell")
        
        // 밀어서 삭제 활성화
        tableView.isEditing = false
        
        // 구분선 없애기
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add a memo", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.backgroundColor = .systemTeal
        
        button.addAction(UIAction { _ in
            
            let viewController = AddingMemoViewController()
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true)
            
        }, for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Memo"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        memoTableView.reloadData()
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
        return memoStore.memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MemoCell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as! MemoCell
        
        let memo: Memo = memoStore.memoList[indexPath.row]
        
        cell.memoTextLabel.text = memo.text
        cell.memoCreatedAtLabel.text = memo.createdAtString
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            // 배열에서 삭제
            memoStore.removeMemo(at: indexPath.row)
            // 테이블뷰에서 삭제 애니메이션
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        default:
            break
        }
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        let viewController = MemoDetailViewController()
        viewController.memo = memoStore.memoList[indexPath.row]
        
        navigationController?.pushViewController(viewController, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

#Preview {
    MemoListViewController()
}

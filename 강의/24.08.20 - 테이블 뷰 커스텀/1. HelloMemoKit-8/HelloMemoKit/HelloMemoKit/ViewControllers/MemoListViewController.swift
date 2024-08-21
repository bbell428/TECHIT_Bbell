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
        tableView.backgroundColor = .systemBackground
        tableView.dataSource = self
        
        // 메모리의 효율적 관리를 위해
        // TableView가 사용할 Cell의 재활용 선언
        tableView.register(MemoCell.self, forCellReuseIdentifier: "MemoCell")
        
        // 밀어서 삭제 활성화
        tableView.isEditing = false
        
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
        return memoStore.memoList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MemoCell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as! MemoCell
        
        let memo: Memo = memoStore.memoList[indexPath.row]
        
        cell.memoTextLabel.text = memo.text
        cell.memoCreatedAtLabel.text = memo.createdAtString
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
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
}

// 커스텀 셀 만들기
class MemoCell: UITableViewCell {
    
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
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(memoTextLabel)
        stackView.addArrangedSubview(memoCreatedAtLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    MemoListViewController()
}

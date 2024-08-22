//
//  MemoListViewController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

class MemoListViewController: BaseStackViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let memoStore: MemoStore = MemoStore.shared
    
    // 검색 입력
    private lazy var searchView: UITextField = {
        let searchView = UITextField()
        
        searchView.placeholder = "검색어를 입력해주세요."
        searchView.borderStyle = .line
        
        searchView.addAction(UIAction {_ in
            self.memoStore.filterMemos(searchText: searchView.text ?? "")
            self.memoTableView.reloadData()
            print("text : \(searchView.text ?? "")")
        }, for: .editingChanged)
        
        return searchView
    }()
    
    // 검색 입력 삭제
    private lazy var searchDelete: UIButton = {
        let DeleteBtn = UIButton()
        DeleteBtn.setTitle("지우기", for: .normal)
        DeleteBtn.titleLabel?.font = .systemFont(ofSize: 20)
        DeleteBtn.backgroundColor = .memoThemeColor
        
        DeleteBtn.addAction(UIAction { _ in
            self.searchView.text = ""
            self.memoStore.filterMemos(searchText: "")
            self.memoTableView.reloadData()
        }, for: .touchUpInside)
        
        return DeleteBtn
    }()
    
    // 글
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
    
    // 추가 버튼
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add a memo", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.backgroundColor = .memoThemeColor
        
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
        
        memoStore.filteredMemoList = memoStore.memoList
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        memoTableView.reloadData()
    }

    override func setupInterface() {
        super.setupInterface()
        
        verticalStackView.addArrangedSubview(searchView)
        verticalStackView.addArrangedSubview(searchDelete)
        
        stackView.addArrangedSubview(verticalStackView)
        stackView.addArrangedSubview(memoTableView)
        stackView.addArrangedSubview(addButton)
    }
    
    /*
    override func setupLayout() {
        super.setupLayout()
    }
    */
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoStore.filteredMemoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MemoCell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as! MemoCell
        
        let memo: Memo = memoStore.filteredMemoList[indexPath.row]
        
        
        cell.memoTextLabel.text = memo.text
        cell.memoCreatedAtLabel.text = memo.createdAtString
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            // 배열에서 삭제
            memoStore.removeMemo(at: memoStore.filteredMemoList[indexPath.row].id)
            
            // 테이블뷰에서 삭제 애니메이션
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        default:
            break
        }
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        // let viewController = MemoWebDetailViewController()
        let viewController = MemoDetailViewController()
        viewController.memo = memoStore.filteredMemoList[indexPath.row]
        
        navigationController?.pushViewController(viewController, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

#Preview {
    MemoListViewController()
}

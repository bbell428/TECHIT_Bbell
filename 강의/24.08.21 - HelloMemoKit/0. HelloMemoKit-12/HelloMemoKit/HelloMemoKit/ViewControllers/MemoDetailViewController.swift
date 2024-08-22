//
//  MemoDetailViewController.swift
//  HelloMemoKit
//
//  Created by Jongwook Park on 8/20/24.
//

import UIKit

class MemoDetailViewController: BaseStackViewController {
    
    var memo: Memo? = Memo(text: "Hello World", createdAt: Date())
  
    private lazy var memoTextView: UITextView = {
        let textView = UITextView()
        textView.font = .preferredFont(forTextStyle: .largeTitle)
        textView.isEditable = false
        return textView
    }()
    /*
    private lazy var memoTextLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 15
        return label
    }()
    */
    
    private lazy var memoCreatedAtLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Memo Detail"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        memoTextView.text = memo?.text ?? ""
        // memoTextLabel.text = memo?.text ?? ""
        memoCreatedAtLabel.text = memo?.createdAtString ?? ""
    }


    override func setupInterface() {
        super.setupInterface()
        
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(memoTextView)
        // stackView.addArrangedSubview(memoTextLabel)
        stackView.addArrangedSubview(memoCreatedAtLabel)
    }
    
    /*
    override func setupLayout() {
        super.setupLayout()
    }
    */
}

#Preview {
    MemoDetailViewController()
}

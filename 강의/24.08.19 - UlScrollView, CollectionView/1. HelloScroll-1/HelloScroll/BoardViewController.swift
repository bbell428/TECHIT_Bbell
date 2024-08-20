//
//  ViewController.swift
//  HelloScroll
//
//  Created by Jongwook Park on 8/19/24.
//

import UIKit

class BoardViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemMint
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupInterface()
    }

    func setupInterface() {
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeGuide: UILayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: safeGuide.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: safeGuide.centerYAnchor),
            
            scrollView.widthAnchor.constraint(equalTo: safeGuide.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: safeGuide.heightAnchor),
        ])
        
        // ScrollView가 가진 content의 크기를 정한다
        // scrollView의 너비보다 conentSize의 너비가 크면, 좌우 스크롤이 가능
        // scrollView의 높보다 conentSize의 높이가 크면, 상하 스크롤이 가능
        scrollView.contentSize = CGSize(width: 1024, height: 1024)
        
        
    }
}

#Preview {
    BoardViewController()
}

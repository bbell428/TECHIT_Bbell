//
//  WideWideViewController.swift
//  HelloScroll
//
//  Created by Jongwook Park on 8/19/24.
//

import UIKit

class WideWideViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        buildInterface()
    }
    
    func buildInterface() {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let safeGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
        ])
        
        // 좌우로는 화면 폭을 그대로 쓰면서, 상하로만 스크롤 되도록 만들기
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        
        // 스크롤 뷰 안에 StackView 만들기
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        scrollView.addSubview(contentStackView)
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // 중복되지 않게 이름을 가져와서 저장
        let uniqueNames = Set(travelArray.map { $0.name })
        
        // 저장된 이름을 배열로 선언하고, 정렬해서 함수 실행
        for user in Array(uniqueNames.sorted()) {
            nameLabel(StackView: contentStackView, user: user) // 이름 생성
            travelScroll(StackView: contentStackView, user: user) // 사진 스크롤 생성
        }
    }
    
    // 이름 라벨 생성하기
    func nameLabel(StackView: UIStackView, user: String) {
        // StackView에 Label 추가
        let label = UILabel()
        label.text = user
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        StackView.addArrangedSubview(label)
    }
    
    // 각 스크롤 생성하기
    func travelScroll(StackView: UIStackView, user: String) {
        // 다시 작은 scrollView를 만들어서 StackView에 추가
        let miniScrollView = UIScrollView()
        miniScrollView.backgroundColor = .clear // 배경을 투명하게
        miniScrollView.contentSize = CGSize(width: 1024, height: 150)
        // miniScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 150)
        
        miniScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            miniScrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
            miniScrollView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        StackView.addArrangedSubview(miniScrollView)
        
        // user 값으로만 필터링 하기 (ex. name이 "박준영"으로 된 요소만 가져오기)
        let filterUser = travelArray.filter { $0.name == user }
        
        // 가져온 요소를 통해 for문으로 돌려서 이미지 추가
        for (index, travel) in filterUser.enumerated() {
            let imageView = UIImageView()
            Task {
                do {
                    let urlImage = try await UIImage.fetchImage(from: travel.url)
                    DispatchQueue.main.async {
                        imageView.image = urlImage
                    }
                    
                    imageView.contentMode = .scaleAspectFit
                    // 이미지 간격
                    let spacing : CGFloat = 10
                    imageView.frame = CGRect(x: (150 + spacing) * CGFloat(index), y: 0, width: 150, height: 150)
                    // 이미지를 선택했을때 동작할 방식(대체 코드 : 버튼으로 만든 후, UIAction)
                    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
                    imageView.isUserInteractionEnabled = true // 사용자 상호작용
                    imageView.addGestureRecognizer(tapGesture)
                    /// 선택된 이미지 url과 동일한 url이 있는지 travelArray에서 검색 후,
                    /// 동일한 url이 있는 travelArray의 인덱스값을 tag값으로 넣음. (Navigation 값으로 넣기위함)
                    if let originalIndex = travelArray.firstIndex(where: { $0.url == travel.url }) {
                        imageView.tag = originalIndex
                    }
                    miniScrollView.addSubview(imageView)
                }
            }
        }
    }
    
    /* private lazy var button: UIButton = {
     let button = UIButton()
     button.setImage(UIImage(systemName:
     "arrowshape.backward.fill"), for: .normal)
     
     // iOS 14 버전부터 가능
     let action = UIAction(handler: { action in
         self.webView.goBack()
     })
     
     button.addAction(action, for: .touchUpInside)
     return button
     }()
    */
    
    // 이미지 클릭시, 상세페이지로 이동
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        guard let tappedImageView = sender.view as? UIImageView else { return }
        let index = tappedImageView.tag
        self.navigationController?.pushViewController(HelloViewController(index: index), animated: true)
    }
}

#Preview {
    WideWideViewController()
}

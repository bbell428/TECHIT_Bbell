//
//  SelectedViewController.swift
//  HelloScroll
//
//  Created by 박준영 on 8/19/24.
//

import Foundation
import UIKit

class HelloViewController: UIViewController {
    var index: Int?
    
    init(index: Int) {
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let label = UILabel()
        label.text = travelArray[index!].name
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let locationLabel = UILabel()
        locationLabel.text = "위치: \(travelArray[index!].location)"
        locationLabel.font = UIFont.systemFont(ofSize: 16)
        locationLabel.textColor = .darkGray
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView()
        Task{
            do {
                let urlImage = try await UIImage.fetchImage(from: travelArray[index!].url)
                DispatchQueue.main.async {
                    imageView.image = urlImage
                }
            }
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        view.addSubview(locationLabel)
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -150),
            
            locationLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
}

#Preview {
    HelloViewController(index:3)
}




import UIKit

// 기본 예제

class ViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.backgroundColor = .systemBlue
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupInterface()
    }

    func setupInterface() {
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        
    }

}

#Preview {
    ViewController()
}

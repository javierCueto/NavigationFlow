//
//  PostAddViewController.swift
//  NavigationFlow
//
//  Created by Javier Cueto on 21/12/23.
//

import UIKit

protocol PostAddViewControllerDelegate: AnyObject {
    func didSaveData(homePost: HomePost)
}

final class PostAddViewController: UIViewController {
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: PostAddViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        view.addSubview(saveButton)
        view.backgroundColor = .systemBackground
        saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        saveButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        saveButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
    }
    
    @objc func saveButtonAction() {
        delegate?.didSaveData(homePost: HomePost(title: Date().ISO8601Format(), description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."))
        dismiss(animated: true)
    }
}

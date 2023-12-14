//
//  LoginViewController.swift
//  NavigationFlow
//
//  Created by Javier Cueto on 13/12/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.image = UIImage(named: "goku")
        return imageView
    }()
    
    let mainStackView: UIStackView = {
      let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "email@email.com"
        let yellowColor: UIColor = UIColor(named: "yelloww") ?? .systemGray6
        textField.backgroundColor = yellowColor
        let leftView = UIView()
        leftView.translatesAutoresizingMaskIntoConstraints = false
        leftView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "pass"
        let yellowColor: UIColor = UIColor(named: "yelloww") ?? .systemGray6
        textField.backgroundColor = yellowColor
        let leftView = UIView()
        leftView.translatesAutoresizingMaskIntoConstraints = false
        leftView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 8
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    

    func configUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(profileImageView)
        profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 40).isActive = true
        mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        mainStackView.addArrangedSubview(emailTextField)
        mainStackView.addArrangedSubview(passwordTextField)
        
    }

}

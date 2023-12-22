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
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        return button
    }()
    
    let loginSession: LoginSession
    
    init(loginSession: LoginSession) {
        self.loginSession = loginSession
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    

    func configUI() {
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        view.addSubview(profileImageView)
        profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 40).isActive = true
        mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        mainStackView.addArrangedSubview(emailTextField)
        mainStackView.addArrangedSubview(passwordTextField)
        mainStackView.addArrangedSubview(loginButton)
        
    }
    
    @objc func loginButtonAction() {
        print("fsdf")
        let controller = MainTabBarViewController()
        navigationController?.isNavigationBarHidden = true
        navigationController?.viewControllers = [controller]
        loginSession.login()
    }

}

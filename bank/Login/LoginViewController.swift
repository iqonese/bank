//
//  ViewController.swift
//  bank
//
//  Created by Said Tura Saidazimov on 04.04.2025.
//

import UIKit

class LoginViewController: UIViewController {
    let titleLabel          = UILabel()
    let subtitle            = UILabel()
    let loginView           = LoginView()
    let signInButton        = UIButton(type: .system)
    let errorMessageLabel   = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 40, weight: .medium)
        titleLabel.text = "Bank"
        
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textColor = .black
        subtitle.textAlignment = .center
        subtitle.numberOfLines = 2
        subtitle.text = "Your premium source for all things banking"
        subtitle.font = .systemFont(ofSize: 30)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.text = "Error failure"
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(subtitle)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // title
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitle.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 2)
        ])
        //subtitle
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitle.bottomAnchor, multiplier: 3),
            subtitle.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            loginView   .trailingAnchor .constraint(equalTo: subtitle.trailingAnchor)
        ])
        //loginview
        NSLayoutConstraint.activate([
            loginView   .centerYAnchor  .constraint(equalTo: view.centerYAnchor),
            loginView   .leadingAnchor  .constraint(equalToSystemSpacingAfter: view.leadingAnchor,          multiplier: 1),
            view        .trailingAnchor .constraint(equalToSystemSpacingAfter: loginView.trailingAnchor,    multiplier: 1),
            signInButton.leadingAnchor  .constraint(equalToSystemSpacingAfter: view.leadingAnchor,          multiplier: 1),
            view        .trailingAnchor .constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1),
            signInButton.topAnchor      .constraint(equalToSystemSpacingBelow: loginView.bottomAnchor,      multiplier: 2)
        ])
        //errormessage
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor,      multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

//MARK: - Actions
extension LoginViewController {
    @objc private func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username or password is empty")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username or password is empty")
            return
        }
        
        if username == "Kevin" && password == "Abc" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username or password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}


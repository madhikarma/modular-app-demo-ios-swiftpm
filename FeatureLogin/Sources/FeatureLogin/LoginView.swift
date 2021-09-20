//
//  LoginView.swift
//
//
//  Created by Shagun on 19/09/2021.
//

import Foundation
import UIKit

public class LoginView: UIView {
    public let usernameTextField = UITextField()
    public let passwordTextField = UITextField()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupUsernameTextField()
        setupPasswordTextField()
    }

    private func setupUsernameTextField() {
        addSubview(usernameTextField)
        usernameTextField.placeholder = "Username"
    }

    private func setupPasswordTextField() {
        addSubview(passwordTextField)
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .white
    }
    
    private func setupConstraints() {
        setupUsernameTextFieldConstraints()
        setupPasswordTextFieldConstraints()
    }
    
    private func setupUsernameTextFieldConstraints() {
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            usernameTextField.heightAnchor.constraint(equalToConstant: 60)
        ])

    }
    
    private func setupPasswordTextFieldConstraints() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60)
        ])

    }
}

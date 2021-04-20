//
//  EntryAccountViewController.swift
//  ZATON
//
//  Created by Константин on 09.04.2021.
//

import UIKit

final class EntryAccountViewController: UIViewController {
    
    let image = UIImageView(image: UIImage(named: "person"))
    let signInLabel = UILabel()
    let startLabel = UILabel()
    let signInButton = GreenButton(title: "ВОЙТИ")
    let signUpButton = WhiteButton(title: "ЗАРЕГИСТРИРОВАТЬСЯ")
    let longLabel = UILabel()
    let supportButton = SupportButton()
    
    let presenter = EntryAccountPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.view = self
        
        self.view.backgroundColor = UIColor(red: 0.9, green: 1, blue: 0.91, alpha: 1)

        self.view.addSubview(image)
        self.view.addSubview(signInButton)
        self.view.addSubview(signUpButton)
        self.view.addSubview(supportButton)
        setupSignInLabel()
        setupStartLabel()
        setupLongLabel()
    }
    
    private func setupSignInLabel() {
        signInLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        signInLabel.font = UIFont(name: "Montserrat-Bold", size: 24)
        signInLabel.text = "Войдите в профиль"
        signInLabel.textAlignment = .center
        self.view.addSubview(signInLabel)
    }
    
    private func setupStartLabel() {
        startLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        startLabel.font = UIFont(name: "Montserrat-Regular", size: 18)
        startLabel.textAlignment = .center
        startLabel.text = "Начните покупки прямо сейчас"
        startLabel.textAlignment = .center
        self.view.addSubview(startLabel)
    }
    
    private func setupLongLabel() {
        longLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        longLabel.font = UIFont(name: "Montserrat-Regular", size: 18)
        longLabel.numberOfLines = 0
        longLabel.lineBreakMode = .byWordWrapping
        longLabel.textAlignment = .center
        longLabel.text = "После регистрации вам будут доступны все возможности приложения"
        self.view.addSubview(longLabel)
    }
    
    private func setupConstraints() {
        [
            signInLabel,
            image,
            signInButton,
            signUpButton,
            startLabel,
            longLabel,
            supportButton,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            image.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: seventyUp),
            image.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: hundredfive),
            image.heightAnchor.constraint(equalToConstant: hundredfive),
            
            signInLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 65),
            signInLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            signInLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            signInLabel.heightAnchor.constraint(equalToConstant: 26),
            
            startLabel.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: thirtyUp),
            startLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            startLabel.heightAnchor.constraint(equalToConstant: 20),
            
            signInButton.topAnchor.constraint(equalTo: startLabel.bottomAnchor, constant: thirtyUp),
            signInButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: thirty7Right),
            signInButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -thirty7Right),
            signInButton.heightAnchor.constraint(equalToConstant: 56),
            
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: twentyUp),
            signUpButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: thirty7Right),
            signUpButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -thirty7Right),
            signUpButton.heightAnchor.constraint(equalToConstant: 56),
            
            longLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: thirtyUp),
            longLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: thirty7Right),
            longLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -thirty7Right),
            longLabel.heightAnchor.constraint(equalToConstant: 73),
            
            supportButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -thirtyUp),
            supportButton.heightAnchor.constraint(equalToConstant: 48),
            supportButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: twentyright),
            supportButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -twentyright),
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
}

//
//  AccountButtons.swift
//  ZATON
//
//  Created by Константин on 09.04.2021.
//

import UIKit

final class SupportButton: UIButton {
    
    let image = UIImageView(image: UIImage(named: "questionMark"))
    let title = UILabel()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        self.isEnabled = true
        title.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        title.font = UIFont(name: "Montserrat-Regular", size: 14)
        title.text = "Служба поддержки"
        title.textAlignment = .left
        self.addSubview(title)
        
        self.addSubview(image)
        
        self.backgroundColor = .white
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 4
        self.layer.cornerRadius = 10
    }
    
    private func setupConstraints() {
        image.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        [
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            image.widthAnchor.constraint(equalToConstant: 15),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
            title.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            title.heightAnchor.constraint(equalTo: self.heightAnchor),
        ].forEach {
            $0.isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


final class GreenButton: UIButton {
    
    private var text: String
    
    init(title: String) {
        self.text = title
        super.init(frame: .zero)
        setupUI()
    }
    
    private func setupUI() {

        self.backgroundColor = UIColor(red: 0.1412, green: 0.7608, blue: 0.451, alpha: 1)
        
        setTitle(self.text, for: .normal)
        self.titleLabel?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        self.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        self.titleLabel?.textAlignment = .center
        
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 4
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class WhiteButton: UIButton {
    
    var text: String
    
    init(title: String) {
        self.text = title
        super.init(frame: .zero)
        setupUI()
    }
    
    private func setupUI() {
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 0.1412, green: 0.7608, blue: 0.451, alpha: 1).cgColor
        
        setTitle(self.text, for: .normal)
        self.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        self.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        self.titleLabel?.textAlignment = .center

        self.layer.backgroundColor = UIColor.white.withAlphaComponent(0).cgColor
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 4
        self.layer.cornerRadius = 15
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



//
//  TopBar.swift
//  ZATON
//
//  Created by Константин on 13.04.2021.
//

import UIKit

final class TopBar: UIView {
    
    let title = UILabel()
    let button = UIButton()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        self.layer.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1).cgColor
        self.layer.cornerRadius = 20
        
        title.textColor = UIColor(red: 0.143, green: 0.762, blue: 0.453, alpha: 1)
        title.font = UIFont(name: "Montserrat-Bold", size: 24)
        title.text = "Fruits"
        self.addSubview(title)
        
        button.setImage(UIImage(named: "backButton"), for: .normal)
        self.addSubview(button)
    }
    
    private func setupConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        [
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            title.heightAnchor.constraint(equalToConstant: 27),
             
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            button.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 32),
            button.heightAnchor.constraint(equalTo: button.widthAnchor),
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



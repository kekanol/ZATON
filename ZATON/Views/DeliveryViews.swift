//
//  DeliveryViews.swift
//  ZATON
//
//  Created by Константин on 14.04.2021.
//

import UIKit

final class LightGreenButton: UIButton {
    
    let topLabel = UILabel()
    let botLabel = UILabel()
    private let image = UIImageView(image: UIImage(named: "arrowBot"))
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = UIColor(red: 0.365, green: 0.843, blue: 0.604, alpha: 1)
        self.layer.cornerRadius = 15
        
        topLabel.text = "Время доставки"
        topLabel.textAlignment = .left
        topLabel.font = UIFont(name: "Montserrat-Regular", size: 12)
        topLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        self.addSubview(topLabel)
        
        botLabel.text = "Как можно скорее"
        botLabel.textAlignment = .left
        botLabel.font = UIFont(name: "Montserrat-Medium", size: 18)
        botLabel.textColor = .white
        self.addSubview(botLabel)
        
        self.addSubview(image)
    }
    
    private func setupConstraints() {
        botLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        
        [
            topLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            topLabel.heightAnchor.constraint(equalToConstant: 14),
            
            botLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10),
            botLabel.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor),
            botLabel.heightAnchor.constraint(equalToConstant: 22),
            
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -twentyright),
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 8),
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class CoolTextField: UIView {
    
    let rect = UIView()
    var textField = UITextField()
    
    init() {
        super.init(frame: .zero)
        rect.backgroundColor = UIColor(red: 0.808, green: 0.808, blue: 0.808, alpha: 1)
        self.addSubview(rect)
        self.addSubview(textField)
        
        rect.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        [
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.bottomAnchor.constraint(equalTo: rect.topAnchor),
            
            rect.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            rect.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            rect.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.03),
            rect.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach {
            $0.isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

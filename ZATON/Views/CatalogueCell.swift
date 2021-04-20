//
//  CatalogueCell.swift
//  ZATON
//
//  Created by Константин on 06.04.2021.
//

import UIKit

final class CatalogueCell: UIView {
    
    let label = UILabel()
    let button = UIButton()
    private var image: String
    private var text: String
    
    
    init(text: String, image: String) {
        self.image = image
        self.text = text
        super.init(frame: .zero)
        setupUI()
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        setupButton()
        setupLabel()
        layout()
    }
    
    private func setupButton() {
        button.titleLabel?.text = text
        let image = UIImage(named: self.image)
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 4
        self.addSubview(button)
    }
    
    private func setupLabel() {
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Montserrat-Bold", size: 21)
        label.attributedText = NSMutableAttributedString(string: self.text, attributes: [NSAttributedString.Key.kern: 1.16])
        label.textAlignment = .center
        self.addSubview(label)
    }
    
    private func layout() {
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        [
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.widthAnchor.constraint(equalTo: self.widthAnchor),
            label.heightAnchor.constraint(equalToConstant: 24),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            //button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 180 / 133),

        
        ].forEach {
            $0.isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

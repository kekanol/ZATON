//
//  CartCell.swift
//  ZATON
//
//  Created by Константин on 08.04.2021.
//

import UIKit

final class CartCell : UICollectionViewCell {
    
    let minusButton = UIButton()
    let plusButton = UIButton()
    let count = UILabel()
    private let imageView = UIImageView()
    let name = UILabel()
    let weight = UILabel()
    let priceLabel = UILabel()
    
    var image: String = "Rectangle 45"
    var index = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        
        self.backgroundColor = .clear
        setupMinus()
        setupPlus()
        setupCount()
        setupImage()
        setupName()
        setupWeight()
        setupPrice()
        setupConstraints()
    }
    
    private func setupMinus() {
        minusButton.setTitle("-", for: .normal)
        minusButton.backgroundColor = UIColor(red: 0.879, green: 0.876, blue: 0.876, alpha: 1)
        minusButton.layer.cornerRadius = 3
        self.addSubview(minusButton)
    }
    
    private func setupPlus() {
        plusButton.setTitle("+", for: .normal)
        plusButton.backgroundColor = UIColor(red: 0.879, green: 0.876, blue: 0.876, alpha: 1)
        plusButton.layer.cornerRadius = 3
        self.addSubview(plusButton)
    }
    
    private func setupCount() {
        count.textColor = UIColor(red: 0.096, green: 0.076, blue: 0.076, alpha: 0.65)
        count.font = UIFont(name: "Montserrat-Light", size: 17)
        count.text = "1"
        count.textAlignment = .center
        self.addSubview(count)
    }
    
    private func setupImage() {
        imageView.image = UIImage(named: image)
        self.addSubview(imageView)
    }
    
    private func setupName() {
        name.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        name.font = UIFont(name: "Montserrat-Regular", size: 14)
        name.numberOfLines = 0
        name.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.89
        name.attributedText = NSMutableAttributedString(string: "Батон нарезной", attributes: [NSAttributedString.Key.kern: 0.77, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        name.textAlignment = .left
        self.addSubview(name)
    }
    
    private func setupWeight() {
        weight.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65)
        weight.font = UIFont(name: "Montserrat-Regular", size: 12)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.73
        weight.text = "250 г"
        weight.textAlignment = .left
        self.addSubview(weight)
    }
    
    private func setupPrice() {
        priceLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.81)
        priceLabel.font = UIFont(name: "Montserrat-Regular", size: 12)
        priceLabel.text = "14.40 р"
        priceLabel.textAlignment = .right
        self.addSubview(priceLabel)
    }
    
    private func setupConstraints() {
        [
            minusButton,
            plusButton,
            count,
            imageView,
            name,
            weight,
            priceLabel
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            minusButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            minusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            minusButton.widthAnchor.constraint(equalToConstant: 20),
            minusButton.heightAnchor.constraint(equalTo: minusButton.widthAnchor),
            
            count.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor),
            count.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            count.widthAnchor.constraint(equalTo: minusButton.widthAnchor),
            count.heightAnchor.constraint(equalTo: minusButton.heightAnchor),
            
            plusButton.leadingAnchor.constraint(equalTo: count.trailingAnchor),
            plusButton.heightAnchor.constraint(equalTo: minusButton.heightAnchor),
            plusButton.widthAnchor.constraint(equalTo: minusButton.widthAnchor),
            plusButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: plusButton.trailingAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 60),
            
            name.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            name.topAnchor.constraint(equalTo: self.topAnchor),
            name.widthAnchor.constraint(equalToConstant: 135),
            name.heightAnchor.constraint(equalToConstant: 25),
            
            weight.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            weight.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            weight.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            weight.widthAnchor.constraint(equalToConstant: 40),
            
            priceLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            priceLabel.leadingAnchor.constraint(equalTo: name.trailingAnchor),
            priceLabel.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

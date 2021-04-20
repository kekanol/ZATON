//
//  EmptyCartView.swift
//  ZATON
//
//  Created by Константин on 08.04.2021.
//

import UIKit

final class EmptyCartView: UIView {
    
    
    let cart = UIImageView(image: UIImage(named: "cart"))
    let whiteCircle = UIView()
    let grayCircle = UIView()
    let bigCircle = UIView()
    let emptyCartLabel = UILabel()
    let bigLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        
        // TODO make circles rounded
        whiteCircle.layer.backgroundColor = UIColor.white.cgColor
        whiteCircle.frame.size = CGSize(width: 64, height: 64)
        whiteCircle.layer.cornerRadius = whiteCircle.frame.size.width / 2
        whiteCircle.addSubview(cart)
        
        grayCircle.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.6)
        grayCircle.frame.size = CGSize(width: 98, height: 98)
        grayCircle.layer.cornerRadius = grayCircle.frame.size.height / 2
        grayCircle.addSubview(whiteCircle)
        
        bigCircle.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.2)
        bigCircle.frame.size = CGSize(width: 136, height: 136)
        bigCircle.layer.cornerRadius = bigCircle.frame.size.height / 2
        bigCircle.addSubview(grayCircle)
        self.addSubview(bigCircle)
        
        emptyCartLabel.textColor = UIColor(red: 0, green: 0.013, blue: 0.006, alpha: 1)
        emptyCartLabel.font = UIFont(name: "Montserrat-Bold", size: 24)
        emptyCartLabel.attributedText = NSMutableAttributedString(string: "Ваша корзина пуста", attributes: [NSAttributedString.Key.kern: 1.32])
        emptyCartLabel.textAlignment = .center
        self.addSubview(emptyCartLabel)
        
        
        bigLabel.textColor = UIColor(red: 0, green: 0.013, blue: 0.006, alpha: 1)
        bigLabel.font = UIFont(name: "Montserrat-Regular", size: 14)
        bigLabel.numberOfLines = 0
        bigLabel.lineBreakMode = .byWordWrapping
        bigLabel.textAlignment = .center
        bigLabel.attributedText = NSMutableAttributedString(string: "Самое время добавить что-то. Просто перейдите в каталог", attributes: [NSAttributedString.Key.kern: 0.77])
        bigLabel.textAlignment = .center
        self.addSubview(bigLabel)
        
    }
    
    private func setupConstraints() {
        [
            cart,
            whiteCircle,
            grayCircle,
            bigCircle,
            emptyCartLabel,
            bigLabel,
            
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            cart.centerYAnchor.constraint(equalTo: whiteCircle.centerYAnchor),
            cart.centerXAnchor.constraint(equalTo: whiteCircle.centerXAnchor),
            cart.widthAnchor.constraint(equalToConstant: 30),
            cart.heightAnchor.constraint(equalToConstant: 35),
            
            whiteCircle.centerXAnchor.constraint(equalTo: grayCircle.centerXAnchor),
            whiteCircle.centerYAnchor.constraint(equalTo: grayCircle.centerYAnchor),
            whiteCircle.widthAnchor.constraint(equalToConstant: 64),
            whiteCircle.heightAnchor.constraint(equalToConstant: 64),
            
            grayCircle.centerXAnchor.constraint(equalTo: bigCircle.centerXAnchor),
            grayCircle.centerYAnchor.constraint(equalTo: bigCircle.centerYAnchor),
            grayCircle.widthAnchor.constraint(equalToConstant: 98),
            grayCircle.heightAnchor.constraint(equalToConstant: 98),
            
            bigCircle.widthAnchor.constraint(equalToConstant: 136),
            bigCircle.heightAnchor.constraint(equalToConstant: 136),
            bigCircle.topAnchor.constraint(equalTo: self.topAnchor),
            bigCircle.bottomAnchor.constraint(equalTo: emptyCartLabel.topAnchor, constant: -30),
            bigCircle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            emptyCartLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            emptyCartLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            emptyCartLabel.heightAnchor.constraint(equalToConstant: 25),
            emptyCartLabel.bottomAnchor.constraint(equalTo: bigLabel.topAnchor, constant: -30),
            
            bigLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bigLabel.widthAnchor.constraint(equalToConstant: 278),
            bigLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 40),
        ].forEach {
            $0.isActive = true
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class OrderButton: UIButton {
    
    var price: Float = 0 {
        didSet {
            setupUI()
        }
    }
    private let label = UILabel()
    private let priceLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = UIColor(red: 0.1412, green: 0.7608, blue: 0.451, alpha: 1)
        self.layer.cornerRadius = 15
        
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Montserrat-Bold", size: 17)
        label.attributedText = NSMutableAttributedString(string: "Оформить заказ", attributes: [NSAttributedString.Key.kern: 0.94])
        label.textAlignment = .left
        self.addSubview(label)
        
        priceLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        priceLabel.font = UIFont(name: "Montserrat-Bold", size: 17)
        priceLabel.text = "\(self.price.convertToTwo) р"
        priceLabel.textAlignment = .right
        self.addSubview(priceLabel)
    }
    
    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            label.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
            
            priceLabel.topAnchor.constraint(equalTo: self.topAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

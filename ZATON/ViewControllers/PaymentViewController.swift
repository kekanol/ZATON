//
//  PaymentViewController.swift
//  ZATON
//
//  Created by Константин on 20.04.2021.
//

import UIKit

final class PaymentViewController: UIViewController {
    
    let zaton = UILabel()
    let market = UILabel()
    let topBar = TopBar()
    let payByCard = UILabel()
    let cardView = CardView()
    let price = UILabel()
    let greenButton = GreenButton(title: "Оплатить")
    let longLabel = UILabel()
    
    let presenter = PaymentPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        
        self.view.backgroundColor = .white
        self.topBar.title.text = "Оплатить"
        self.view.addSubview(topBar)
        setupZaton()
        setupMarket()
        setupPayByCard()
        self.view.addSubview(cardView)
        setupPrice()
        self.view.addSubview(greenButton)
        setupLongLabel()
    }
    
    private func setupLongLabel() {
        longLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        longLabel.font = UIFont(name: "Montserrat-Medium", size: 16)
        longLabel.numberOfLines = 0
        longLabel.lineBreakMode = .byWordWrapping
        longLabel.textAlignment = .center
        longLabel.attributedText = NSMutableAttributedString(string: "Нажимая кнопку “Оплатить”,вы\n соглашаетесь с офертой.", attributes: [NSAttributedString.Key.kern: 0.08])
        self.view.addSubview(longLabel)
    }
    
    private func setupPrice() {
        price.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        price.font = UIFont(name: "Montserrat-SemiBold", size: 24)
        price.text = "150 руб."
        price.textAlignment = .center
        self.view.addSubview(price)
    }
    
    private func setupPayByCard() {
        payByCard.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        payByCard.font = UIFont(name: "Montserrat-Medium", size: 24)
        payByCard.attributedText = NSMutableAttributedString(string: "Оплата картой", attributes: [NSAttributedString.Key.kern: 0.12])
        payByCard.textAlignment = .center
        self.view.addSubview(payByCard)
    }
    
    private func setupMarket() {
        market.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        market.font = UIFont(name: "Montserrat-Medium", size: 24)
        market.attributedText = NSMutableAttributedString(string: "Маркет", attributes: [NSAttributedString.Key.kern: 0.12])
        market.textAlignment = .center
        self.view.addSubview(market)
    }
    
    private func setupZaton() {
        zaton.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        zaton.font = UIFont(name: "Montserrat-ExtraBold", size: 48)
        zaton.attributedText = NSMutableAttributedString(string: "ZATON", attributes: [NSAttributedString.Key.kern: 2.64])
        zaton.textAlignment = .center
        view.addSubview(zaton)
    }
    
    private func setupConstraints() {
        
        [
            zaton,
            market,
            topBar,
            payByCard,
            cardView,
            price,
            greenButton,
            longLabel,
            
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        [
            topBar.topAnchor.constraint(equalTo: self.view.topAnchor),
            topBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            topBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            topBar.heightAnchor.constraint(equalToConstant: hundredfive - twentyUp),
            
            zaton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            zaton.topAnchor.constraint(equalTo: self.topBar.bottomAnchor, constant: thirtyUp),
            zaton.widthAnchor.constraint(equalToConstant: 190),
            zaton.heightAnchor.constraint(equalToConstant: 47),
            
            market.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            market.topAnchor.constraint(equalTo: zaton.bottomAnchor, constant: 8),
            market.widthAnchor.constraint(equalToConstant: 95),
            market.heightAnchor.constraint(equalToConstant: 26),
            
            payByCard.topAnchor.constraint(equalTo: market.bottomAnchor, constant: hundredfive - twentyUp),
            payByCard.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            payByCard.heightAnchor.constraint(equalToConstant: 26),
            payByCard.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            
            cardView.topAnchor.constraint(equalTo: payByCard.bottomAnchor, constant: thirtyUp),
            cardView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            cardView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95),
            cardView.heightAnchor.constraint(equalToConstant: hundredfive * 2),
            
            price.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: twentyUp),
            price.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            price.heightAnchor.constraint(equalToConstant: 26),
            
            greenButton.topAnchor.constraint(equalTo: price.bottomAnchor, constant: fourtyUp),
            greenButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
            greenButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            greenButton.heightAnchor.constraint(equalToConstant: 43),
            
            longLabel.topAnchor.constraint(equalTo: greenButton.bottomAnchor, constant: fourtyUp),
            longLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            longLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            
            
        ].forEach { $0.isActive = true }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
    
}

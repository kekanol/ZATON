//
//  CatalogViewController.swift
//  ZATON
//
//  Created by Константин on 06.04.2021.
//

import UIKit

final class CatalogViewController : UIViewController {
    
    let zaton = UILabel()
    let delivery = UILabel()
    let catalogLabel = UILabel()
    let fruits = CatalogueCell(text: "Фрукты", image: "Fruits")
    let vegetables = CatalogueCell(text: "Овощи", image: "Vegetables")
    let nuts = CatalogueCell(text: "Орехи", image: "Nuts")
    let secs = CatalogueCell(text: "Сухофрукты", image: "Secs")
    let green = CatalogueCell(text: "Зелень", image: "Green")
    let spices = CatalogueCell(text: "Специи", image: "Spices")
    
    let presenter = CatalogPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.view = self
        
        self.view.backgroundColor = UIColor(red: 0.9, green: 1, blue: 0.91, alpha: 1)
        setupZaton()
        setupDelivery()
        setupCatalogue()
        self.view.addSubview(fruits)
        fruits.button.addTarget(self.presenter, action: #selector(presenter.show(_:)), for: .touchUpInside)
        self.view.addSubview(vegetables)
        vegetables.button.addTarget(self.presenter, action: #selector(presenter.show(_:)), for: .touchUpInside)
        self.view.addSubview(nuts)
        nuts.button.addTarget(self.presenter, action: #selector(presenter.show(_:)), for: .touchUpInside)
        self.view.addSubview(secs)
        secs.button.addTarget(self.presenter, action: #selector(presenter.show(_:)), for: .touchUpInside)
        self.view.addSubview(green)
        green.button.addTarget(self.presenter, action: #selector(presenter.show(_:)), for: .touchUpInside)
        self.view.addSubview(spices)
        spices.button.addTarget(self.presenter, action: #selector(presenter.show(_:)), for: .touchUpInside)
    }
    
    private func setupZaton() {
        zaton.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        zaton.font = UIFont(name: "Montserrat-ExtraBold", size: 32)
        zaton.attributedText = NSMutableAttributedString(string: "ZATON", attributes: [NSAttributedString.Key.kern: 1.76])
        zaton.textAlignment = .center
        self.view.addSubview(zaton)
    }
    
    private func setupDelivery() {
        delivery.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        delivery.font = UIFont(name: "Montserrat-Medium", size: 14)
        delivery.attributedText = NSMutableAttributedString(string: "Доставка продуктов", attributes: [NSAttributedString.Key.kern: 0.07])
        delivery.textAlignment = .center
        self.view.addSubview(delivery)
    }
    
    private func setupCatalogue() {
        catalogLabel.textColor = UIColor(red: 0.143, green: 0.762, blue: 0.453, alpha: 1)
        catalogLabel.font = UIFont(name: "Montserrat-ExtraBold", size: 28)
        catalogLabel.attributedText = NSMutableAttributedString(string: "Каталог товаров", attributes: [NSAttributedString.Key.kern: 1.54])
        catalogLabel.textAlignment = .center
        self.view.addSubview(catalogLabel)
    }
    
    private func setupConstraints() {
        [
            zaton,
            delivery,
            catalogLabel,
            fruits,
            vegetables,
            nuts,
            secs,
            green,
            spices
            
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            zaton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: twentyUp),
            zaton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            zaton.widthAnchor.constraint(equalToConstant: 126),
            zaton.heightAnchor.constraint(equalToConstant: 31),
            
            delivery.topAnchor.constraint(equalTo: zaton.bottomAnchor, constant: 6),
            delivery.centerXAnchor.constraint(equalTo: zaton.centerXAnchor),
            delivery.widthAnchor.constraint(equalToConstant: 154),
            delivery.heightAnchor.constraint(equalToConstant: 23),
            
            catalogLabel.topAnchor.constraint(equalTo: delivery.bottomAnchor, constant: twentyUp),
            catalogLabel.centerXAnchor.constraint(equalTo: delivery.centerXAnchor),
            catalogLabel.widthAnchor.constraint(equalToConstant: 280),
            catalogLabel.heightAnchor.constraint(equalToConstant: 31),
            
            fruits.topAnchor.constraint(equalTo: catalogLabel.bottomAnchor, constant: fiftyUp),
            fruits.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 17),
            fruits.trailingAnchor.constraint(equalTo: vegetables.leadingAnchor, constant: -17),
            fruits.bottomAnchor.constraint(equalTo: nuts.topAnchor, constant: -fiftyUp),
            
            nuts.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 17),
            nuts.trailingAnchor.constraint(equalTo: secs.leadingAnchor, constant: -17),
            nuts.bottomAnchor.constraint(equalTo: green.topAnchor, constant: -fiftyUp),
            nuts.widthAnchor.constraint(equalTo: fruits.widthAnchor),
            nuts.heightAnchor.constraint(equalTo: fruits.heightAnchor),
            
            green.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 17),
            green.trailingAnchor.constraint(equalTo: spices.leadingAnchor, constant: -17),
            green.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -thirtyUp),
            green.widthAnchor.constraint(equalTo: fruits.widthAnchor),
            green.heightAnchor.constraint(equalTo: fruits.heightAnchor),
            
            vegetables.topAnchor.constraint(equalTo: fruits.topAnchor),
            vegetables.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -17),
            vegetables.bottomAnchor.constraint(equalTo: secs.topAnchor, constant: -fiftyUp),
            vegetables.widthAnchor.constraint(equalTo: fruits.widthAnchor),
            vegetables.heightAnchor.constraint(equalTo: fruits.heightAnchor),
            
            secs.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -17),
            secs.bottomAnchor.constraint(equalTo: spices.topAnchor, constant: -fiftyUp),
            secs.widthAnchor.constraint(equalTo: fruits.widthAnchor),
            secs.heightAnchor.constraint(equalTo: fruits.heightAnchor),
            
            spices.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -17),
            spices.bottomAnchor.constraint(equalTo: green.bottomAnchor),
            spices.widthAnchor.constraint(equalTo: fruits.widthAnchor),
            spices.heightAnchor.constraint(equalTo: fruits.heightAnchor),
            
        ].forEach {
            $0.isActive = true
        }
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

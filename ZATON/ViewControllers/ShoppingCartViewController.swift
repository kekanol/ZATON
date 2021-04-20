//
//  ShoppingCartViewController.swift
//  ZATON
//
//  Created by Константин on 08.04.2021.
//

import UIKit

final class ShoppingCartViewController: UIViewController {
    
    let cartLabel = UILabel()
    let deleteButton = UIButton()
    let colectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let notEnoughLabel = UILabel()
    let orderButton = OrderButton()
    let emptyCartView = EmptyCartView()
    let alert = OkCancelAlert()
    
    var minimalOrder: Double = 1000
    
    let presenter = ShoppingCartPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.view = self
        self.presenter.products = [Product(), Product()]
        self.view.backgroundColor = UIColor(red: 0.9, green: 1, blue: 0.91, alpha: 1)

        setupCartlabel()
        setupDeleteButton()
        setupCollection()
        setupEnoughLabel()
        self.view.insertSubview(orderButton, at: 1)
        orderButton.addTarget(presenter, action: #selector(presenter.makeOrder(_:)), for: .touchUpInside)
        self.view.insertSubview(emptyCartView, at: 0)
        
        self.parent!.view.addSubview(alert)
        alert.botButton.addTarget(presenter, action: #selector(presenter.cancel), for: .touchUpInside)
        alert.topButton.addTarget(presenter, action: #selector(presenter.deleteAll), for: .touchUpInside)
    }
    
    private func setupCartlabel() {
        cartLabel.textColor = UIColor(red: 0.143, green: 0.762, blue: 0.453, alpha: 1)
        cartLabel.font = UIFont(name: "Montserrat-ExtraBold", size: 28)
        cartLabel.attributedText = NSMutableAttributedString(string: "Корзина", attributes: [NSAttributedString.Key.kern: 1.54])
        cartLabel.textAlignment = .center
        self.view.addSubview(cartLabel)
    }
    
    private func setupDeleteButton() {
        deleteButton.setImage(UIImage(named:"trash"), for: .normal)
        self.view.insertSubview(deleteButton, at: 0)
        deleteButton.addTarget(presenter, action: #selector(presenter.deleteButton), for: .touchUpInside)
    }
    
    private func setupCollection() {
        self.colectionView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.colectionView.delegate = self
        self.colectionView.dataSource = self
        self.colectionView.register(CartCell.self, forCellWithReuseIdentifier: "cell")
        self.colectionView.backgroundColor = .clear
        let layout = UICollectionViewFlowLayout()
        self.colectionView.showsVerticalScrollIndicator = false
        layout.scrollDirection = .vertical
        self.colectionView.collectionViewLayout = layout
        self.view.insertSubview(colectionView, at: 0)
        self.colectionView.backgroundColor = UIColor(white: 1, alpha: 0)    }
    
    private func setupEnoughLabel() {
        notEnoughLabel.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        notEnoughLabel.font = UIFont(name: "Montserrat-Regular", size: 16)
        notEnoughLabel.attributedText = NSMutableAttributedString(string: "Минимальный заказ \(minimalOrder) р", attributes: [NSAttributedString.Key.kern: 0.88])
        notEnoughLabel.textAlignment = .left
        self.view.addSubview(notEnoughLabel)
    }
    
    private func setupConstraints() {
        
        cartLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        colectionView.translatesAutoresizingMaskIntoConstraints = false
        notEnoughLabel.translatesAutoresizingMaskIntoConstraints = false
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        emptyCartView.translatesAutoresizingMaskIntoConstraints = false
        alert.translatesAutoresizingMaskIntoConstraints = false
        
        [
            cartLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            cartLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            cartLabel.heightAnchor.constraint(equalToConstant: 28),
            
            deleteButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            deleteButton.centerYAnchor.constraint(equalTo: cartLabel.centerYAnchor),
            deleteButton.widthAnchor.constraint(equalToConstant: 20),
            deleteButton.heightAnchor.constraint(equalToConstant: 23),
            
            notEnoughLabel.topAnchor.constraint(lessThanOrEqualTo: cartLabel.bottomAnchor, constant: fiftyUp),
            notEnoughLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 14),
            notEnoughLabel.heightAnchor.constraint(equalToConstant: 16),
            notEnoughLabel.widthAnchor.constraint(equalToConstant: 285),
            
            emptyCartView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            emptyCartView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            emptyCartView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            emptyCartView.heightAnchor.constraint(equalToConstant: 260),
            
            orderButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -twentyUp),
            orderButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            orderButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
            orderButton.heightAnchor.constraint(equalToConstant: 56),
            
            colectionView.topAnchor.constraint(equalTo: notEnoughLabel.bottomAnchor),
            colectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            colectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            colectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            alert.topAnchor.constraint(equalTo: self.parent!.view.topAnchor),
            alert.leadingAnchor.constraint(equalTo: self.parent!.view.leadingAnchor),
            alert.trailingAnchor.constraint(equalTo: self.parent!.view.trailingAnchor),
            alert.bottomAnchor.constraint(equalTo: self.parent!.view.bottomAnchor),
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
}

extension ShoppingCartViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CartCell
        let product = self.presenter.products[indexPath.row]
        cell.count.text = "\(product.count)"
        cell.image = product.image
        cell.name.text = product.name
        cell.priceLabel.text = "\(product.price.convertToTwo) р"
        cell.weight.text = "\(product.weight) г"
        cell.index = indexPath.row
        cell.plusButton.addTarget(presenter, action: #selector(presenter.plus(_:)), for: .touchUpInside)
        cell.minusButton.addTarget(presenter, action: #selector(presenter.minus(_:)), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: orderButton.frame.height + thirtyUp, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}

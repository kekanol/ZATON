//
//  DiscountsViewController.swift
//  ZATON
//
//  Created by Константин on 06.04.2021.
//

import UIKit

final class DiscountsViewController: UIViewController {
    
    let topCollection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let bottomCollection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let discountLabel = UILabel()
    let freeDelivery = FreeDeliveryView()
    let discounts = UILabel()
    let topCountLabel = UILabel()
    let freeFoodLabel = UILabel()
    let bottomCount = UILabel()
    
    let presenter = DiscountsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.view = self
        
        self.view.backgroundColor = UIColor(red: 0.9, green: 1, blue: 0.91, alpha: 1)
        setupDiscountLabel()
        self.view.addSubview(freeDelivery)
        setupDiscounts()
        setupTopCount()
        setupTop()
        setupBotom()
        setupFreeFood()
        setupBottomCount()
    }
    
    
    private func setupDiscountLabel() {
        discountLabel.textColor = UIColor(red: 0.143, green: 0.762, blue: 0.453, alpha: 1)
        discountLabel.font = UIFont(name: "Montserrat-ExtraBold", size: 28)
        discountLabel.attributedText = NSMutableAttributedString(string: "Акции", attributes: [NSAttributedString.Key.kern: 1.54])
        discountLabel.textAlignment = .center
        self.view.addSubview(discountLabel)
    }
    
    private func setupDiscounts() {
        discounts.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        discounts.font = UIFont(name: "Montserrat-Bold", size: 28)
        discounts.attributedText = NSMutableAttributedString(string: "Скидки", attributes: [NSAttributedString.Key.kern: 1.54])
        discounts.textAlignment = .left
        self.view.addSubview(discounts)
    }
    
    private func setupTopCount() {
        topCountLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        topCountLabel.font = UIFont(name: "Montserrat-Medium", size: 14)
        topCountLabel.attributedText = NSMutableAttributedString(string: "5", attributes: [NSAttributedString.Key.kern: 0.07])
        self.view.addSubview(topCountLabel)
    }
    
    private func setupFreeFood() {
        freeFoodLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        freeFoodLabel.font = UIFont(name: "Montserrat-Bold", size: 28)
        freeFoodLabel.attributedText = NSMutableAttributedString(string: "Еда за баллы", attributes: [NSAttributedString.Key.kern: 1.54])
        freeFoodLabel.textAlignment = .left
        self.view.addSubview(freeFoodLabel)
    }
    
    private func setupBottomCount() {
        bottomCount.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        bottomCount.font = UIFont(name: "Montserrat-Medium", size: 14)
        bottomCount.attributedText = NSMutableAttributedString(string: "43", attributes: [NSAttributedString.Key.kern: 0.07])
        bottomCount.textAlignment = .center
        self.view.addSubview(bottomCount)
        
    }
    
    private func setupTop() {
        self.topCollection.delegate = self
        self.topCollection.register(DiscountViewCell.self, forCellWithReuseIdentifier: "cell")
        self.topCollection.dataSource = self
        self.topCollection.isScrollEnabled = true
        self.topCollection.showsHorizontalScrollIndicator = false
        self.topCollection.backgroundColor = .clear
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.topCollection.collectionViewLayout = layout
        self.view.addSubview(topCollection)
    }
    
    private func setupBotom() {
        self.bottomCollection.delegate = self
        self.bottomCollection.register(DiscountViewCell.self, forCellWithReuseIdentifier: "cell")
        self.bottomCollection.dataSource = self
        self.bottomCollection.isScrollEnabled = true
        self.bottomCollection.showsHorizontalScrollIndicator = false
        self.bottomCollection.backgroundColor = .clear
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.bottomCollection.collectionViewLayout = layout
        self.view.addSubview(bottomCollection)
    }
    
    private func setupConstraints() {
        
        self.topCollection.translatesAutoresizingMaskIntoConstraints = false
        self.discountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.freeDelivery.translatesAutoresizingMaskIntoConstraints = false
        self.discounts.translatesAutoresizingMaskIntoConstraints = false
        self.topCountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.freeFoodLabel.translatesAutoresizingMaskIntoConstraints = false
        self.bottomCount.translatesAutoresizingMaskIntoConstraints = false
        self.bottomCollection.translatesAutoresizingMaskIntoConstraints = false
        
        [
            discountLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            discountLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            discountLabel.widthAnchor.constraint(equalToConstant: 110),
            discountLabel.heightAnchor.constraint(equalToConstant: 30),
            
            freeDelivery.bottomAnchor.constraint(equalTo: discounts.topAnchor, constant: -thirty7Up),
            freeDelivery.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: twentyright),
            freeDelivery.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -twentyright),
            freeDelivery.heightAnchor.constraint(equalToConstant: 110),
            
            discounts.bottomAnchor.constraint(equalTo: topCollection.topAnchor, constant: -twentyUp),
            discounts.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: twentyright),
            discounts.widthAnchor.constraint(equalToConstant: 125),
            discounts.heightAnchor.constraint(equalToConstant: thirtyUp),
            
            topCountLabel.leadingAnchor.constraint(equalTo: discounts.trailingAnchor, constant: 6),
            topCountLabel.bottomAnchor.constraint(equalTo: discounts.bottomAnchor),
            topCountLabel.widthAnchor.constraint(equalToConstant: twentyright),
            topCountLabel.heightAnchor.constraint(equalToConstant: 15),
            
            freeFoodLabel.bottomAnchor.constraint(equalTo: bottomCollection.topAnchor, constant: -twentyUp),
            freeFoodLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: twentyright),
            freeFoodLabel.widthAnchor.constraint(equalToConstant: 220),
            freeFoodLabel.heightAnchor.constraint(equalToConstant: thirtyUp),
            
            bottomCount.leadingAnchor.constraint(equalTo: freeFoodLabel.trailingAnchor, constant: 6),
            bottomCount.bottomAnchor.constraint(equalTo: freeFoodLabel.bottomAnchor),
            bottomCount.widthAnchor.constraint(equalToConstant: twentyright),
            bottomCount.heightAnchor.constraint(equalToConstant: 15),
            
            topCollection.bottomAnchor.constraint(equalTo: freeFoodLabel.topAnchor, constant: -twentyUp),
            topCollection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            topCollection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            topCollection.heightAnchor.constraint(equalToConstant: horizontalcellheight),
            
            bottomCollection.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -twentyUp),
            bottomCollection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomCollection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomCollection.heightAnchor.constraint(equalTo: topCollection.heightAnchor),
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
    
}

extension DiscountsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topCollection {
            return presenter.topCollection.count
        } else if collectionView == bottomCollection {
            return presenter.botCollection.count
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DiscountViewCell
        var discount = Discount()
        if collectionView == topCollection {
            discount = presenter.topCollection[indexPath.row] as Discount
        } else if collectionView == bottomCollection {
            discount = presenter.botCollection[indexPath.row] as Discount
        }
        cell.image = discount.image
        cell.label.text = discount.text
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: twentyright, bottom: 6, right: twentyright)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 243, height: collectionView.frame.height - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}

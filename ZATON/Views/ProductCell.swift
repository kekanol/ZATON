//
//  ProductCell.swift
//  ZATON
//
//  Created by Константин on 13.04.2021.
//

import UIKit

final class ProductCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    let likeButton = LikeButton()
    let title = UILabel()
    let price = UILabel()
    let weight = UILabel()
    let cartButton = UIButton()

    var image: String = "Rectangle 45"
    var index = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        self.layer.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1).cgColor
        self.layer.cornerRadius = 20
        
        imageView.image = UIImage(named: image)
        let shadowPath = UIBezierPath(roundedRect: imageView.bounds, cornerRadius: 5)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 4
        layer0.shadowOffset = CGSize(width: 4, height: 4)
        layer0.bounds = imageView.bounds
        layer0.position = imageView.center
        imageView.layer.insertSublayer(layer0, at: 0)
        
        imageView.addSubview(likeButton)
        self.addSubview(imageView)
        
        title.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        title.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        title.text = "Bananas"
        self.addSubview(title)
        
        price.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        price.font = UIFont(name: "Montserrat-Medium", size: 12)
        price.text = "100p"
        self.addSubview(price)
        
        weight.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        weight.font = UIFont(name: "Montserrat-Medium", size: 10)
        weight.text = "1kg"
        self.addSubview(weight)
        
        cartButton.setImage(UIImage(named: "bag"), for: .normal)
        self.addSubview(cartButton)
    }
    
    private func setupConstraints() {
        [
            likeButton,
            imageView,
            title,
            price,
            weight,
            cartButton,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            likeButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 6),
            likeButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 6),
            likeButton.widthAnchor.constraint(equalToConstant: 16),
            likeButton.heightAnchor.constraint(equalTo: likeButton.widthAnchor),
            
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: 130),
            
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 6),
            title.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            title.heightAnchor.constraint(equalToConstant: 16),
            
            weight.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            weight.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            weight.heightAnchor.constraint(equalToConstant: 11),
            
            price.topAnchor.constraint(equalTo: weight.bottomAnchor, constant: 7),
            price.leadingAnchor.constraint(equalTo: weight.leadingAnchor),
            price.heightAnchor.constraint(equalToConstant: 13),
            price.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
            
            cartButton.bottomAnchor.constraint(equalTo: price.bottomAnchor),
            cartButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
            cartButton.widthAnchor.constraint(equalToConstant: 22),
            cartButton.heightAnchor.constraint(equalTo: cartButton.widthAnchor),
            
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


final class LikeButton: UIButton {
    
    var isLiked: Bool = false {
        didSet {
            setupUI()
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    private func setupUI() {
        if isLiked {
            self.setImage(UIImage(named: "Liked"), for: .normal)
        } else {
            self.setImage(UIImage(named: "notLiked"), for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

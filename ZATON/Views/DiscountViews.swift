//
//  DiscountViews.swift
//  ZATON
//
//  Created by Константин on 06.04.2021.
//

import UIKit

final class DiscountViewCell: UICollectionViewCell {
    
    
    private var imageView = UIImageView()
    var label = UILabel()
    var image: String = "Rectangle 22 (3)"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        setupShadows()
        setupLabel()
        setupImage()
        setupConstraints()
    }
    
    private func setupShadows() {
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 25)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 4
        self.backgroundColor = UIColor(red: 0.557, green: 0.867, blue: 0.71, alpha: 1)
        self.layer.cornerRadius = 30

    }
    
    private func setupImage() {
        let image = UIImage(named: self.image)
        self.imageView = UIImageView(image: image)
        imageView.autoresizesSubviews = true
        self.addSubview(imageView)
    }
    
    private func setupLabel() {
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Montserrat-Medium", size: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Скидка 20% при заказе от 2000 р"
        label.textAlignment = .left
        self.addSubview(label)
    }
    
    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            label.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -30),
            
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.heightAnchor.constraint(equalToConstant: horizontalcellheight * 0.4),
            
        ].forEach {
            $0.isActive = true
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class FreeDeliveryView: UIView {
    
    var text: String = "Доставим продукты за 1 рубль"
    let label = UILabel()
    var image1 = "bannana_1-1024x1024 1"
    var image2 = "bannana_1-1024x1024 1"
    var image3 = "bannana_1-1024x1024 1"
    
    init() {
        super.init(frame: .zero)
        setupUI()
        
    }
    
    private func setupUI() {
        setupBackground()
        setupLabel()
        setupImages()
    }
    
    private func setupBackground() {
        self.backgroundColor = UIColor(red: 0.1412, green: 0.7608, blue: 0.451, alpha: 1)
        
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 25)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 4
        self.layer.cornerRadius = 25
    }
    
    private func setupLabel() {
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Montserrat-Bold", size: 20)
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.82
        label.attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.kern: 1.21, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.textAlignment = .center
        self.insertSubview(label, at: 0)
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupImages() {
        let img1 = UIImage(named: image1)
        let imgView1 = UIImageView(image: img1)
        imgView1.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(imgView1, at: 0)
        
        let img2 = UIImage(named: image2)
        let imgView2 = UIImageView(image: img2)
        imgView2.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(imgView2, at: 0)
        
        let img3 = UIImage(named: image3)
        let imgView3 = UIImageView(image: img3)
        imgView3.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(imgView3, at: 0)
        
        [
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: imgView1.leadingAnchor, constant: -13),
            label.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.37),
            
            imgView1.heightAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 1/6),
            imgView1.widthAnchor.constraint(equalTo: imgView1.heightAnchor),
            imgView1.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            imgView1.trailingAnchor.constraint(equalTo: imgView2.leadingAnchor, constant: -6),
            
            imgView2.heightAnchor.constraint(equalTo: imgView1.heightAnchor),
            imgView2.widthAnchor.constraint(equalTo: imgView1.widthAnchor),
            imgView2.centerYAnchor.constraint(equalTo: imgView1.centerYAnchor),
            imgView2.trailingAnchor.constraint(equalTo: imgView3.leadingAnchor, constant: -6),
            
            imgView3.heightAnchor.constraint(equalTo: imgView1.heightAnchor),
            imgView3.widthAnchor.constraint(equalTo: imgView2.widthAnchor),
            imgView3.centerYAnchor.constraint(equalTo: imgView2.centerYAnchor),
            imgView3.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6),

        
        ].forEach {
            $0.isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

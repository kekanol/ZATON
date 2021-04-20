//
//  ProductsViewCounroller.swift
//  ZATON
//
//  Created by Константин on 13.04.2021.
//

import UIKit

final class ProductsViewCounroller: UIViewController {
    
    let topBar = TopBar()
    let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()
    )
    let cartButton = UIButton()
    
    let presenter = ProductsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.view = self
        
        self.view.backgroundColor = .white
        setupTopBar()
        setupCollection()
        topBar.button.addTarget(presenter, action: #selector(self.presenter.dismiss(_:)), for: .touchUpInside)
    }
    
    private func setupTopBar() {
        topBar.addSubview(cartButton)
        
        cartButton.setImage(UIImage(named: "bag"), for: .normal)
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        cartButton.centerYAnchor.constraint(equalTo: topBar.title.centerYAnchor).isActive = true
        cartButton.trailingAnchor.constraint(equalTo: topBar.trailingAnchor, constant: -8).isActive = true
        cartButton.widthAnchor.constraint(equalToConstant: thirtyUp).isActive = true
        cartButton.heightAnchor.constraint(equalTo: cartButton.widthAnchor).isActive = true
        
        self.view.addSubview(topBar)
    }
    
    private func setupCollection() {
        self.collection.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.collection.delegate = self
        self.collection.dataSource = self
        self.collection.register(ProductCell.self, forCellWithReuseIdentifier: "cell")
        self.collection.showsVerticalScrollIndicator = false
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.collection.collectionViewLayout = layout
        self.view.addSubview(self.collection)
        self.collection.backgroundColor = UIColor(white: 1, alpha: 0)
    }
    
    private func setupConstraints() {
        self.topBar.translatesAutoresizingMaskIntoConstraints = false
        self.collection.translatesAutoresizingMaskIntoConstraints = false
        [
            
            self.topBar.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.topBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.topBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.topBar.heightAnchor.constraint(equalToConstant: hundredfive - twentyUp),
            
            self.collection.topAnchor.constraint(equalTo: self.topBar.bottomAnchor),
            self.collection.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.collection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            self.collection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
}

extension ProductsViewCounroller: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCell
        let product = presenter.products[indexPath.row]
        cell.image = product.image
        cell.title.text = product.name
        cell.price.text = "\(product.price.convertToTwo) р"
        cell.weight.text = "\(product.weight) г"
        cell.index = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let leftAndRightPaddings: CGFloat = 20
        let numberOfItemsPerRow: CGFloat = 2.0
        
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: 219)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

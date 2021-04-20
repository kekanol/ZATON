//
//  RecomendedViewController.swift
//  ZATON
//
//  Created by Константин on 08.04.2021.
//

import UIKit

final class RecomendedViewController: UIViewController, UISearchBarDelegate {
    
    let searchBar = UISearchBar()
    let textLabel = UILabel()
    let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let presenter = RecomendedPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.view = self
        
        self.view.backgroundColor = UIColor(red: 0.9, green: 1, blue: 0.91, alpha: 1)
        self.setupToHideKeyboardOnTapOnView()

        setupSearchBar()
        setupTextLabel()
        setupCollection()
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.keyboardType = .alphabet
        searchBar.barTintColor = self.view.backgroundColor
        searchBar.layer.borderWidth = 0
        searchBar.placeholder = "Поиск"
        searchBar.searchBarStyle = .minimal
        self.view.addSubview(searchBar)
    }
    
    private func setupTextLabel() {
        textLabel.textColor = UIColor(red: 0, green: 0.013, blue: 0.006, alpha: 1)
        textLabel.font = UIFont(name: "Montserrat-ExtraBold", size: 24)
        textLabel.text = "Рекомендуемые товары"
        textLabel.textAlignment = .center
        self.view.addSubview(textLabel)
    }
    
    private func setupCollection() {
        self.collection.layoutMargins = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        self.collection.delegate = self
        self.collection.dataSource = self
        self.collection.register(ProductCell.self, forCellWithReuseIdentifier: "cell")
        self.view.addSubview(self.collection)
        self.collection.backgroundColor = UIColor(white: 1, alpha: 0)
        self.collection.showsVerticalScrollIndicator = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //TODO: search func
    }
    
    private func setupConstraints() {
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        [
            searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: thirtyUp),
            searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: twentyUp),
            searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -twentyUp),
            searchBar.heightAnchor.constraint(equalToConstant: fiftyUp),
            
            textLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: twentyUp),
            textLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: thirtyRight),
            textLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -thirtyRight),
            textLabel.heightAnchor.constraint(equalToConstant: thirtyUp),
            
            self.collection.topAnchor.constraint(equalTo: self.textLabel.bottomAnchor, constant: 10),
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

extension RecomendedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.recomended.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCell
        let product = presenter.recomended[indexPath.row]
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension UIViewController {
    func setupToHideKeyboardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

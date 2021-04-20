//
//  ProductsPresenter.swift
//  ZATON
//
//  Created by Константин on 13.04.2021.
//

import Foundation

final class ProductsPresenter {
    
    weak var view : ProductsViewCounroller?
    
    var products: [Product] = [] {
        didSet {
            view?.collection.reloadData()
        }
    }
    
    @objc func dismiss(_ sender: AnyObject) {
        view?.navigationController?.popViewController(animated: true)
    }
}

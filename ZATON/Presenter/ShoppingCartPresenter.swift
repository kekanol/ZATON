//
//  ShoppingCartPresenter.swift
//  ZATON
//
//  Created by Константин on 13.04.2021.
//

import Foundation
import UIKit

final class ShoppingCartPresenter {
    
    weak var view : ShoppingCartViewController?
    
    var products: [Product] = [] {
        didSet {
            if products.count == 0 {
                view?.emptyCartView.isHidden = false
                view?.orderButton.isHidden = true
                view?.notEnoughLabel.isHidden = true
            } else {
                view?.emptyCartView.isHidden = true
                view?.orderButton.isHidden = false
                var count: Float = 0
                products.forEach { product in
                    count += product.price.convertToTwo
                }
                total = count
            }
            self.view?.colectionView.reloadData()
        }
    }
    
    var total: Float = 0.0 {
        didSet {
            if self.total > 1000 {
                view?.notEnoughLabel.isHidden = true
            } else {
                view?.notEnoughLabel.isHidden = false
            }
            view?.orderButton.price = total
        }
    }
    
    init() {
        self.products = []
    }
    
    
    @objc func deleteButton() {
        if products.count != 0 {
            self.view?.alert.isHidden = false
        }
    }
    
    @objc func deleteAll() {
        self.products.removeAll()
        self.view?.alert.isHidden = true
    }
    
    @objc func cancel() {
        self.view?.alert.isHidden = true
    }
    
    @objc func makeOrder(_ sender: AnyObject) {
        if (view?.orderButton.price)! > 1000 {
            let vc = DeliveryViewController()
            vc.presenter.price = (view?.orderButton.price.convertToTwo)!
            vc.presenter.delivery = 130
            vc.presenter.products = self.products
            vc.modalPresentationStyle = .fullScreen
            view?.present(vc, animated: true)
        }
    }
    
    @objc func plus(_ sender: UIButton) {
        let cell = sender.superview as! CartCell
        let index = cell.index
        let product = products[index]
        product.count += 1
        product.price = product.price / Float(product.count - 1) * Float(product.count)
        products[index] = product
    }
    
    @objc func minus(_ sender: UIButton) {
        let cell = sender.superview as! CartCell
        let index = cell.index
        let product = products[index]
        product.count -= 1
        if product.count == 0 {
            self.products.remove(at: index)
        } else {
            product.price = product.price / Float(product.count + 1) * Float(product.count)
            products[index] = product
        }
    }
}

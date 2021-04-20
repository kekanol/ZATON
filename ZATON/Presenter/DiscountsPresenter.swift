//
//  DiscountsPresenter.swift
//  ZATON
//
//  Created by Константин on 13.04.2021.
//

final class DiscountsPresenter {
    
    weak var view : DiscountsViewController?
    
    var topCollection: [Discount] = [] {
        didSet {
            view?.topCountLabel.text = "\(topCollection.count)"
            view?.bottomCollection.reloadData()
        }
    }
    
    var botCollection: [Discount] = [] {
        didSet {
            view?.bottomCount.text = "\(botCollection.count)"
            view?.bottomCollection.reloadData()
        }
    }
    
    var free: [String] = ["bannana_1-1024x1024 1", "bannana_1-1024x1024 1", "bannana_1-1024x1024 1"] {
        didSet {
            view?.freeDelivery.image1 = free.first!
            view?.freeDelivery.image2 = free[1]
            view?.freeDelivery.image3 = free.last!
        }
    }
}


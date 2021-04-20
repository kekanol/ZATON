//
//  RecomendedPresenter.swift
//  ZATON
//
//  Created by Константин on 13.04.2021.
//

final class RecomendedPresenter {
    
    weak var view : RecomendedViewController?
    
    var recomended: [Product] = [] {
        didSet {
            view?.collection.reloadData()
        }
    }
}

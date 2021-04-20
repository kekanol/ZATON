//
//  CatalogPresenter.swift
//  ZATON
//
//  Created by Константин on 13.04.2021.
//

import Foundation
import UIKit

final class CatalogPresenter {
    
    weak var view : CatalogViewController?
    
    
    @objc func show(_ sender: UIButton) {
        let title = sender.titleLabel?.text
        let vc = ProductsViewCounroller()
        vc.topBar.title.text = title
        vc.navigationController?.setNavigationBarHidden(true, animated: false)
        view!.navigationController?.pushViewController(vc, animated: true)
    }
}


//
//  StartPresenter.swift
//  ZATON
//
//  Created by Константин on 13.04.2021.
//

import UIKit

final class StartPresenter {
    
    weak var view : StartViewController?
    
    func animate() {
        sleep(1)
        showMain()
    }
    
    private func showMain() {
        let vc = TabBarViewController()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        view?.present(vc, animated: true)
    }
}

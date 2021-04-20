//
//  StartViewController.swift
//  ZATON
//
//  Created by Константин on 05.04.2021.
//

import UIKit

class StartViewController: UIViewController {

    let group1 = GroupCircles()
    let group2 = GroupCircles()
    let zaton = UILabel()
    let market = UILabel()
    let loading = UILabel()
    
    let presenter = StartPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
        self.view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 0.141, green: 0.761, blue: 0.451, alpha: 1).cgColor
        self.view.insertSubview(group1, at: 0)
        group2.transform = CGAffineTransform(rotationAngle: -3 / 4 * .pi)
        self.view.insertSubview(group2, at: 0)
        setupZaton()
        setupMarket()
        setupLoading()
        
        
    }
    
    func addCircleView() {
        let diceRoll = CGFloat(Int(arc4random_uniform(7))*50)
         let circleWidth = CGFloat(200)
         let circleHeight = circleWidth

            // Create a new CircleView
        let circleView = CircleClosing(frame: CGRect(x: diceRoll, y: 0, width: circleWidth, height: circleHeight))

         view.addSubview(circleView)

         // Animate the drawing of the circle over the course of 1 second
        circleView.animateCircle(duration: 1.0)
    }

    private func setupLoading() {
        loading.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        loading.font = UIFont(name: "Montserrat-Light", size: 14)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.07
        loading.attributedText = NSMutableAttributedString(string: "Загрузка...", attributes: [NSAttributedString.Key.kern: 0.77, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        loading.textAlignment = .center
        self.view.addSubview(loading)
    }
    
    private func setupMarket() {
        market.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        market.font = UIFont(name: "Montserrat-Medium", size: 24)
        market.attributedText = NSMutableAttributedString(string: "Маркет", attributes: [NSAttributedString.Key.kern: 0.12])
        market.textAlignment = .center
        self.view.addSubview(market)
    }
    
    private func setupZaton() {
        zaton.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        zaton.font = UIFont(name: "Montserrat-ExtraBold", size: 48)
        zaton.attributedText = NSMutableAttributedString(string: "ZATON", attributes: [NSAttributedString.Key.kern: 2.64])
        zaton.textAlignment = .center
        view.addSubview(zaton)
    }
    
    private func setupConstarints() {
        let screenSize = UIScreen.main.bounds
        group1.translatesAutoresizingMaskIntoConstraints = false
        group2.translatesAutoresizingMaskIntoConstraints = false
        zaton.translatesAutoresizingMaskIntoConstraints = false
        market.translatesAutoresizingMaskIntoConstraints = false
        loading.translatesAutoresizingMaskIntoConstraints = false
        
        [
            group1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -30),
            group1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -49),
            group1.widthAnchor.constraint(equalToConstant: screenSize.width * 1.12),
            group1.heightAnchor.constraint(equalToConstant: screenSize.height * 0.47),
            
            group2.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60),
            group2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -15),
            group2.widthAnchor.constraint(equalToConstant: screenSize.width * 1.12),
            group2.heightAnchor.constraint(equalToConstant: screenSize.height * 0.47),
            
            zaton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            zaton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 215),
            zaton.widthAnchor.constraint(equalToConstant: 190),
            zaton.heightAnchor.constraint(equalToConstant: 47),
            
            market.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            market.topAnchor.constraint(equalTo: zaton.bottomAnchor, constant: 8),
            market.widthAnchor.constraint(equalToConstant: 95),
            market.heightAnchor.constraint(equalToConstant: 26),
            
            loading.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor, constant: -227),
            loading.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loading.widthAnchor.constraint(equalToConstant: 81),
            loading.heightAnchor.constraint(equalToConstant: 17),
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstarints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.animate()
    }
}


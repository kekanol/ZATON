//
//  Alerts.swift
//  ZATON
//
//  Created by Константин on 14.04.2021.
//

import UIKit

final class OkCancelAlert: UIView {
    
    let title = UILabel()
    let topButton = UIButton()
    let botButton = GreenButton(title: "Отменить")
    let whiteVeiw = UIView()
    init() {
        super.init(frame: .zero)
        setupUI()
        setupCounstraints()
    }
    
    private func setupUI() {
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.hide(_:)))
        self.addGestureRecognizer(recognizer)
        
        self.backgroundColor = UIColor(red: 0.779, green: 0.779, blue: 0.779, alpha: 0.92)
        self.isHidden = true
        
        whiteVeiw.backgroundColor = .white
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 15)
        whiteVeiw.layer.shadowPath = shadowPath.cgPath
        whiteVeiw.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        whiteVeiw.layer.shadowOpacity = 1
        whiteVeiw.layer.shadowOffset = CGSize(width: 2, height: 2)
        whiteVeiw.layer.shadowRadius = 4
        whiteVeiw.layer.cornerRadius = 15
        self.addSubview(whiteVeiw)
        
        whiteVeiw.addSubview(title)
        title.text = "Очистить корзину?"
        title.textAlignment = .center
        title.font = UIFont(name: "Montserrat-Bold", size: 14)
        title.textColor = .black
        
        whiteVeiw.addSubview(topButton)
        topButton.setTitle("OK", for: .normal)
        topButton.titleLabel?.font = botButton.titleLabel?.font
        topButton.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
        topButton.setTitleColor(.white, for: .normal)
        let shadowPath1 = UIBezierPath(roundedRect: topButton.bounds, cornerRadius: botButton.layer.cornerRadius)
        topButton.layer.shadowPath = shadowPath1.cgPath
        topButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.35).cgColor
        topButton.layer.shadowOpacity = 1
        topButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        topButton.layer.shadowRadius = 4
        topButton.layer.cornerRadius = botButton.layer.cornerRadius
        
        whiteVeiw.addSubview(botButton)
    }
    
    private func setupCounstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        topButton.translatesAutoresizingMaskIntoConstraints = false
        botButton.translatesAutoresizingMaskIntoConstraints = false
        whiteVeiw.translatesAutoresizingMaskIntoConstraints = false
        
        [
            whiteVeiw.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            whiteVeiw.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            whiteVeiw.widthAnchor.constraint(equalToConstant: alertWidth),
            whiteVeiw.heightAnchor.constraint(equalToConstant: 200),
            
            title.topAnchor.constraint(equalTo: whiteVeiw.topAnchor, constant: thirtyUp),
            title.centerXAnchor.constraint(equalTo: whiteVeiw.centerXAnchor),
            title.heightAnchor.constraint(equalToConstant: 16),
            
            topButton.topAnchor.constraint(equalTo: title.bottomAnchor, constant: thirtyUp),
            topButton.leadingAnchor.constraint(equalTo: whiteVeiw.leadingAnchor, constant: thirtyRight),
            topButton.trailingAnchor.constraint(equalTo: whiteVeiw.trailingAnchor, constant: -thirtyRight),
            topButton.heightAnchor.constraint(equalToConstant: fourtyUp),
            
            botButton.topAnchor.constraint(equalTo: topButton.bottomAnchor, constant: thirtyUp),
            botButton.leadingAnchor.constraint(equalTo: topButton.leadingAnchor),
            botButton.trailingAnchor.constraint(equalTo: topButton.trailingAnchor),
            botButton.heightAnchor.constraint(equalTo: topButton.heightAnchor),
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    @objc func hide(_ sender: AnyObject) {
        if !whiteVeiw.subviews.contains(sender.view) || sender.view != whiteVeiw {
            UIView.animate(withDuration: 0.3) {
                self.isHidden = true
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

final class PaymentMethod : UIView {
    
    let view = UIView()
    let topLabel = UILabel()
    let onlineImage = UIImageView(image: UIImage(named: "cardOnline"))
    let onlineLabel = UIButton()
    let curierCardImage = UIImageView(image: UIImage(named: "cardOffline"))
    let curierCardLabel = UIButton()
    let curierCashImage = UIImageView(image: UIImage(named: "cash"))
    let curierCashLabel = UIButton()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.hide(_:)))
        self.addGestureRecognizer(recognizer)
        
        self.backgroundColor = UIColor(red: 0.779, green: 0.779, blue: 0.779, alpha: 0.92)
        self.isHidden = true
        
        view.backgroundColor = .white
        self.addSubview(view)
        
        topLabel.font = UIFont(name: "Montserrat-Bold", size: 24)
        topLabel.text = "Способы оплаты"
        topLabel.textAlignment = .left
        topLabel.textColor = .black
        view.addSubview(topLabel)
        
        view.addSubview(onlineImage)
        
        onlineLabel.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 18)
        onlineLabel.setTitle("Картой онлайн", for: .normal)
        onlineLabel.titleLabel?.textAlignment = .left
        onlineLabel.setTitleColor(.black, for: .normal)
        view.addSubview(onlineLabel)
        
        view.addSubview(curierCardImage)
        
        curierCardLabel.setTitle("Картой курьеру", for: .normal)
        curierCardLabel.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 18)
        curierCardLabel.titleLabel?.textAlignment = .left
        curierCardLabel.setTitleColor(.black, for: .normal)
        view.addSubview(curierCardLabel)
        
        view.addSubview(curierCashImage)
        
        curierCashLabel.setTitle("Наличными", for: .normal)
        curierCashLabel.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 18)
        curierCashLabel.titleLabel?.textAlignment = .left
        curierCashLabel.setTitleColor(.black, for: .normal)
        view.addSubview(curierCashLabel)
    }
    
    private func setupConstraints() {
        
        [
            view,
            topLabel,
            onlineLabel,
            onlineImage,
            curierCashLabel,
            curierCashImage,
            curierCardLabel,
            curierCardImage,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
            
            topLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            topLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: thirtyRight),
            topLabel.heightAnchor.constraint(equalToConstant: 30),
            
            onlineImage.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: fourtyUp),
            onlineImage.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor),
            onlineImage.widthAnchor.constraint(equalToConstant: 30),
            onlineImage.heightAnchor.constraint(equalToConstant: 22),
            
            onlineLabel.topAnchor.constraint(equalTo: onlineImage.topAnchor),
            onlineLabel.leadingAnchor.constraint(equalTo: onlineImage.trailingAnchor, constant: twentyright),
            onlineLabel.heightAnchor.constraint(equalTo: onlineImage.heightAnchor),
            
            curierCardImage.topAnchor.constraint(equalTo: onlineImage.bottomAnchor, constant: thirtyUp),
            curierCardImage.leadingAnchor.constraint(equalTo: onlineImage.leadingAnchor),
            curierCardImage.widthAnchor.constraint(equalTo: onlineImage.widthAnchor),
            curierCardImage.heightAnchor.constraint(equalTo: onlineImage.heightAnchor),
            
            curierCardLabel.topAnchor.constraint(equalTo: curierCardImage.topAnchor),
            curierCardLabel.leadingAnchor.constraint(equalTo: curierCardImage.trailingAnchor, constant: twentyright),
            curierCardLabel.heightAnchor.constraint(equalTo: curierCardImage.heightAnchor),
            
            curierCashImage.topAnchor.constraint(equalTo: curierCardImage.bottomAnchor, constant: thirtyUp),
            curierCashImage.leadingAnchor.constraint(equalTo: curierCardImage.leadingAnchor),
            curierCashImage.widthAnchor.constraint(equalTo: curierCardImage.widthAnchor),
            curierCashImage.heightAnchor.constraint(equalTo: curierCardImage.heightAnchor),
            
            curierCashLabel.topAnchor.constraint(equalTo: curierCashImage.topAnchor),
            curierCashLabel.leadingAnchor.constraint(equalTo: curierCashImage.trailingAnchor, constant: twentyright),
            curierCashLabel.heightAnchor.constraint(equalTo: curierCashImage.heightAnchor),
            
            
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    @objc func hide(_ sender: AnyObject) {
        if !view.subviews.contains(sender.view) || sender.view != view {
            self.isHidden = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

final class CodeAlert: UIView {
    
    let title = UILabel()
    let textfield = UITextField()
    let topButton = GreenButton(title: "Применить")
    let whiteVeiw = UIView()
    let grayView = UIView()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupCounstraints()
    }
    
    private func setupUI() {
        self.isHidden = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.hide(_:)))
        self.addGestureRecognizer(recognizer)
        self.backgroundColor = UIColor(red: 0.779, green: 0.779, blue: 0.779, alpha: 0.92)
        self.isHidden = true
        whiteVeiw.backgroundColor = .white
        whiteVeiw.layer.cornerRadius = 15
        self.addSubview(whiteVeiw)
        whiteVeiw.addSubview(grayView)
        grayView.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        grayView.layer.cornerRadius = 5
        grayView.addSubview(title)
        title.text = "Промокод"
        title.textAlignment = .left
        title.font = UIFont(name: "Montserrat-Medium", size: 12)
        title.textColor = UIColor(red: 0.143, green: 0.762, blue: 0.453, alpha: 1)
        grayView.addSubview(textfield)
        textfield.font = UIFont(name: "Montserrat-Medium", size: 22)
        whiteVeiw.addSubview(topButton)
    }
    
    private func setupCounstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        textfield.translatesAutoresizingMaskIntoConstraints = false
        topButton.translatesAutoresizingMaskIntoConstraints = false
        whiteVeiw.translatesAutoresizingMaskIntoConstraints = false
        grayView.translatesAutoresizingMaskIntoConstraints = false
        
        [
            whiteVeiw.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            whiteVeiw.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            whiteVeiw.widthAnchor.constraint(equalToConstant: alertWidth),
            whiteVeiw.heightAnchor.constraint(equalToConstant: 180),
            
            grayView.topAnchor.constraint(equalTo: self.whiteVeiw.topAnchor, constant: thirtyUp),
            grayView.leadingAnchor.constraint(equalTo: whiteVeiw.leadingAnchor, constant: thirtyRight),
            grayView.trailingAnchor.constraint(equalTo: whiteVeiw.trailingAnchor, constant: -thirtyRight),
            grayView.heightAnchor.constraint(equalToConstant: sixtyUp),
            
            title.topAnchor.constraint(equalTo: grayView.topAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: grayView.leadingAnchor, constant: 12),
            title.heightAnchor.constraint(equalToConstant: 14),
            
            textfield.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            textfield.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            textfield.trailingAnchor.constraint(equalTo: grayView.trailingAnchor, constant: -12),
            textfield.heightAnchor.constraint(equalToConstant: 24),
            
            
            topButton.topAnchor.constraint(equalTo: grayView.bottomAnchor, constant: twentyUp),
            topButton.leadingAnchor.constraint(equalTo: whiteVeiw.leadingAnchor, constant: thirtyRight),
            topButton.trailingAnchor.constraint(equalTo: whiteVeiw.trailingAnchor, constant: -thirtyRight),
            topButton.heightAnchor.constraint(equalToConstant: fiftyUp),
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    @objc func hide(_ sender: AnyObject) {
        if !whiteVeiw.subviews.contains(sender.view) || sender.view != whiteVeiw {
            self.isHidden = true
            self.textfield.endEditing(true)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


final class DateAlert: UIView {
    
    let title = UILabel()
    let botButton = GreenButton(title: "Выбрать")
    let leftButton = UIButton()
    let rightButton = UIButton()
    let whiteVeiw = UIView()
    let picker = UIPickerView()
    let line = UIView()
    
    var date: String?
    
    var asSoon: Bool = true {
        didSet {
            if asSoon {
                pickerHeight = 0
                rightButton.backgroundColor =  UIColor(red: 0.712, green: 0.712, blue: 0.712, alpha: 1)
                leftButton.backgroundColor = UIColor(red: 0.35, green: 0.35, blue: 0.35, alpha: 1)
                picker.isHidden = true
            } else {
                pickerHeight = 100
                rightButton.backgroundColor = UIColor(red: 0.35, green: 0.35, blue: 0.35, alpha: 1)
                leftButton.backgroundColor =  UIColor(red: 0.712, green: 0.712, blue: 0.712, alpha: 1)
                picker.isHidden = false
            }
            self.layoutSubviews()
        }
    }
    var pickerHeight: CGFloat = 0
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupCounstraints()
    }
    
    private func setupUI() {
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.hide(_:)))
        self.addGestureRecognizer(recognizer)
        
        self.backgroundColor = UIColor(red: 0.779, green: 0.779, blue: 0.779, alpha: 0.92)
        self.isHidden = true
        
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 15)
        whiteVeiw.layer.shadowPath = shadowPath.cgPath
        whiteVeiw.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        whiteVeiw.layer.shadowOpacity = 1
        whiteVeiw.layer.shadowOffset = CGSize(width: 2, height: 2)
        whiteVeiw.layer.shadowRadius = 4
        whiteVeiw.layer.cornerRadius = 15
        whiteVeiw.backgroundColor = .white
        self.addSubview(whiteVeiw)
        
        whiteVeiw.addSubview(title)
        title.text = "Выберите дату и время"
        title.textAlignment = .center
        title.font = UIFont(name: "Montserrat-Bold", size: 24)
        title.textColor = .black
        
        rightButton.setTitle("Ко времени", for: .normal)
        rightButton.setTitleColor(.white, for: .normal)
        rightButton.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 12)
        rightButton.layer.cornerRadius = 15
        whiteVeiw.addSubview(rightButton)
        
        leftButton.setTitle("Как можно скорее", for: .normal)
        leftButton.setTitleColor(.white, for: .normal)
        leftButton.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 12)
        leftButton.layer.cornerRadius = 15
        whiteVeiw.addSubview(leftButton)
        
        
        picker.backgroundColor = .clear
        whiteVeiw.addSubview(picker)
        
        whiteVeiw.addSubview(botButton)
        
        line.backgroundColor = UIColor(red: 0.712, green: 0.712, blue: 0.712, alpha: 1)
        whiteVeiw.addSubview(line)
    }
    
    private func setupCounstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        botButton.translatesAutoresizingMaskIntoConstraints = false
        whiteVeiw.translatesAutoresizingMaskIntoConstraints = false
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        picker.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        
        [
            whiteVeiw.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            whiteVeiw.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            whiteVeiw.widthAnchor.constraint(equalToConstant: alertWidth),
            whiteVeiw.heightAnchor.constraint(equalToConstant: 170 + pickerHeight),
            
            title.topAnchor.constraint(equalTo: whiteVeiw.topAnchor, constant: 15),
            title.centerXAnchor.constraint(equalTo: whiteVeiw.centerXAnchor),
            title.heightAnchor.constraint(equalToConstant: 26),
            title.widthAnchor.constraint(equalTo: whiteVeiw.widthAnchor),
            
            leftButton.topAnchor.constraint(equalTo: title.bottomAnchor, constant: twentyUp),
            leftButton.leadingAnchor.constraint(equalTo: whiteVeiw.leadingAnchor, constant: thirtyRight),
            leftButton.heightAnchor.constraint(equalToConstant: thirty7Up),
            leftButton.widthAnchor.constraint(equalTo: whiteVeiw.widthAnchor, multiplier: 0.4),
            
            rightButton.topAnchor.constraint(equalTo: title.bottomAnchor, constant: twentyUp),
            rightButton.trailingAnchor.constraint(equalTo: whiteVeiw.trailingAnchor, constant: -thirtyRight),
            rightButton.heightAnchor.constraint(equalToConstant: thirty7Up),
            rightButton.widthAnchor.constraint(equalTo: whiteVeiw.widthAnchor, multiplier: 0.4),
            
            picker.topAnchor.constraint(equalTo: leftButton.bottomAnchor, constant: 9),
            picker.leadingAnchor.constraint(equalTo: whiteVeiw.leadingAnchor),
            picker.trailingAnchor.constraint(equalTo: whiteVeiw.trailingAnchor),
            picker.heightAnchor.constraint(equalToConstant: pickerHeight),
            
            line.leadingAnchor.constraint(equalTo: whiteVeiw.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: whiteVeiw.trailingAnchor),
            line.topAnchor.constraint(equalTo: picker.bottomAnchor),
            line.heightAnchor.constraint(equalToConstant: 1),
            
            botButton.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 7),
            botButton.leadingAnchor.constraint(equalTo: whiteVeiw.leadingAnchor, constant: thirty7Right),
            botButton.trailingAnchor.constraint(equalTo: whiteVeiw.trailingAnchor, constant: -thirty7Right),
            botButton.heightAnchor.constraint(equalToConstant: thirty7Up),
            
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    override func layoutSubviews() {
        whiteVeiw.removeConstraints(whiteVeiw.constraints)
        whiteVeiw.subviews.forEach { $0.removeConstraints($0.constraints)}
        setupCounstraints()
    }
    
    @objc func hide(_ sender: AnyObject) {
        if !whiteVeiw.subviews.contains(sender.view)  || sender.view != whiteVeiw {
            self.isHidden = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

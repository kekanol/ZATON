//
//  PaymentViews.swift
//  ZATON
//
//  Created by Константин on 20.04.2021.
//

import UIKit

final class CardView: UIView {
    
    let visa = UIImageView(image: UIImage(named: "visa"))
    let mastercard = UIImageView(image: UIImage(named: "mastercard"))
    let numberCard = UILabel()
    let numberTextField = UITextField()
    let dateLabel = UILabel()
    let dateTextField = UITextField()
    let cvv = UILabel()
    let cvvTextField = UITextField()
    let remember = UILabel()
    let checkBox = CheckBox()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        
        self.backgroundColor = UIColor(red: 0.878, green: 0.875, blue: 0.875, alpha: 1)
        self.layer.cornerRadius = 5
        
        self.addSubview(visa)
        self.addSubview(mastercard)
        
        setupNumberCard()
        setupNumberTextfield()
        setupDateLabel()
        setupDateTextfield()
        setupCVV()
        setupCVVTextField()
        setupRemember()
        self.addSubview(checkBox)
    }
    
    private func setupRemember() {
        remember.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        remember.font = UIFont(name: "Montserrat-Medium", size: 16)
        remember.attributedText = NSMutableAttributedString(string: "Запомнить карту", attributes: [NSAttributedString.Key.kern: 0.08])
        self.addSubview(remember)
    }
    
    private func setupCVVTextField() {
        cvvTextField.borderStyle = .line
        cvvTextField.backgroundColor = .white
        cvvTextField.placeholder = "CVV"
        cvvTextField.keyboardType = .numberPad
        cvvTextField.font = UIFont(name: "Montserrat-Medium", size: 20)
        self.addSubview(cvvTextField)
    }
    
    private func setupCVV() {
        cvv.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        cvv.font = UIFont(name: "Montserrat-Medium", size: 16)
        cvv.numberOfLines = 0
        cvv.lineBreakMode = .byWordWrapping
        cvv.attributedText = NSMutableAttributedString(string: "CVV/\nCVC", attributes: [NSAttributedString.Key.kern: 0.08])
        self.addSubview(cvv)
    }
    
    private func setupDateTextfield() {
        dateTextField.borderStyle = .line
        dateTextField.backgroundColor = .white
        dateTextField.placeholder = "мм/гг"
        dateTextField.keyboardType = .numberPad
        dateTextField.font = UIFont(name: "Montserrat-Medium", size: 20)
        self.addSubview(dateTextField)
    }
    
    private func setupDateLabel() {
        dateLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        dateLabel.font = UIFont(name: "Montserrat-Medium", size: 16)
        dateLabel.numberOfLines = 0
        dateLabel.lineBreakMode = .byWordWrapping
        dateLabel.attributedText = NSMutableAttributedString(string: "Срок действ.", attributes: [NSAttributedString.Key.kern: 0.08])
        self.addSubview(dateLabel)
    }
    
    private func setupNumberTextfield() {
        numberTextField.borderStyle = .line
        numberTextField.backgroundColor = .white
        numberTextField.placeholder = "Номер карты"
        numberTextField.keyboardType = .numberPad
        numberTextField.font = UIFont(name: "Montserrat-Medium", size: 20)
        self.addSubview(numberTextField)
    }
    
    private func setupNumberCard() {
        numberCard.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        numberCard.font = UIFont(name: "Montserrat-Medium", size: 16)
        numberCard.numberOfLines = 0
        numberCard.lineBreakMode = .byWordWrapping
        numberCard.text = "Номер карты"
        self.addSubview(numberCard)
    }
    
    private func setupConstraints() {
        
        [
            visa,
            mastercard,
            numberCard,
            numberTextField,
            dateLabel,
            dateTextField,
            cvv,
            cvvTextField,
            checkBox,
            remember
            
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        [
            visa.topAnchor.constraint(equalTo: self.topAnchor, constant: twentyUp),
            visa.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: twentyright),
            visa.widthAnchor.constraint(equalToConstant: 25),
            visa.heightAnchor.constraint(equalToConstant: 11),
            
            mastercard.centerYAnchor.constraint(equalTo: visa.centerYAnchor),
            mastercard.leadingAnchor.constraint(equalTo: visa.trailingAnchor, constant: 13),
            mastercard.widthAnchor.constraint(equalToConstant: 16),
            mastercard.heightAnchor.constraint(equalToConstant: 12),
            
            numberCard.topAnchor.constraint(equalTo: visa.bottomAnchor, constant: 13),
            numberCard.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: twentyright),
            numberCard.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/6),
            numberCard.heightAnchor.constraint(equalToConstant: 40),
            
            numberTextField.topAnchor.constraint(equalTo: numberCard.topAnchor),
            numberTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.69),
            numberTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -twentyright),
            numberTextField.heightAnchor.constraint(equalTo: numberCard.heightAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: numberCard.bottomAnchor, constant: 13),
            dateLabel.leadingAnchor.constraint(equalTo: numberCard.leadingAnchor),
            dateLabel.heightAnchor.constraint(equalTo: numberCard.heightAnchor),
            dateLabel.widthAnchor.constraint(equalTo: numberCard.widthAnchor),
            
            dateTextField.topAnchor.constraint(equalTo: dateLabel.topAnchor),
            dateTextField.leadingAnchor.constraint(equalTo: numberTextField.leadingAnchor),
            dateTextField.heightAnchor.constraint(equalTo: dateLabel.heightAnchor),
            dateTextField.widthAnchor.constraint(equalToConstant: 77),
            
            cvv.topAnchor.constraint(equalTo: dateLabel.topAnchor),
            cvv.trailingAnchor.constraint(equalTo: cvvTextField.leadingAnchor, constant: -13),
            cvv.heightAnchor.constraint(equalTo: dateLabel.heightAnchor),
            cvv.widthAnchor.constraint(equalToConstant: 40),
            
            cvvTextField.topAnchor.constraint(equalTo: cvv.topAnchor),
            cvvTextField.trailingAnchor.constraint(equalTo: numberTextField.trailingAnchor),
            cvvTextField.heightAnchor.constraint(equalTo: cvv.heightAnchor),
            cvvTextField.widthAnchor.constraint(equalToConstant: 62),
            
            checkBox.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: twentyUp),
            checkBox.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            checkBox.widthAnchor.constraint(equalToConstant: 17),
            checkBox.heightAnchor.constraint(equalTo: checkBox.widthAnchor),
            
            remember.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 8),
            remember.bottomAnchor.constraint(equalTo: checkBox.bottomAnchor),
            remember.heightAnchor.constraint(equalTo: checkBox.heightAnchor),
            
            
        ].forEach { $0.isActive = true }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

final class CheckBox: UIButton {
    let checkedImage = UIImage(named: "checkBox")
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: .normal)
                self.backgroundColor = .black
            } else {
                self.setImage(nil, for: .normal)
                self.backgroundColor = .clear
            }
        }
    }
    
    init() {
        super.init(frame: .zero)
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: .touchUpInside)
        self.isChecked = false
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
    }
        
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

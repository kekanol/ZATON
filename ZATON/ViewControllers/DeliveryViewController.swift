//
//  DeliveryViewController.swift
//  ZATON
//
//  Created by Константин on 14.04.2021.
//

import UIKit
import MapKit

final class DeliveryViewController: UIViewController {
    
    let topBar = TopBar()
    let scroll = UIScrollView()
    
    let mapView = MKMapView()
    let adress = CoolTextField()
    let apartment = CoolTextField()
    let floor = CoolTextField()
    let doorCode = CoolTextField()
    let entranse = CoolTextField()
    let phone = CoolTextField()
    let comments = CoolTextField()
    let priceLabel = UILabel()
    let price = UILabel()
    let deliveryLabel = UILabel()
    let delivery = UILabel()
    let discountLabel = UILabel()
    let discount = UILabel()
    let totalLabel = UILabel()
    let total = UILabel()
    let longButton = LightGreenButton()
    let shortButton = LightGreenButton()
    let codeButton = UIButton()
    let payButton = UIButton()
    let codeAlert = CodeAlert()
    let paymentMethod = PaymentMethod()
    let dateAlert = DateAlert()
    
    let presenter = DeliveryPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.view = self
        
        setupTopBar()
        setupScroll()
        setupPaymentMethod()
        setupCode()
        setupDate()
        
        self.setupToHideKeyboardOnTapOnView()
        
    }
    
    private func setupDate() {
        view.addSubview(dateAlert)
        dateAlert.asSoon = presenter.asFastAsPossible
        dateAlert.botButton.addTarget(presenter, action: #selector(presenter.timeButton), for: .touchUpInside)
        dateAlert.leftButton.addTarget(presenter, action: #selector(presenter.leftButton), for: .touchUpInside)
        dateAlert.rightButton.addTarget(presenter, action: #selector(presenter.rightButton), for: .touchUpInside)
        dateAlert.picker.delegate = self
        dateAlert.picker.dataSource = self
    }
    
    private func setupCode() {
        codeAlert.textfield.delegate = self
        codeAlert.textfield.placeholder = "Промокод"
        view.addSubview(codeAlert)
        codeAlert.topButton.addTarget(presenter, action: #selector(presenter.codeAlertButton), for: .touchUpInside)
    }
    
    private func setupPaymentMethod() {
        view.addSubview(paymentMethod)
        paymentMethod.curierCardLabel.addTarget(presenter, action: #selector(presenter.setupPayment(_:)), for: .touchUpInside)
        paymentMethod.curierCashLabel.addTarget(presenter, action: #selector(presenter.setupPayment(_:)), for: .touchUpInside)
        paymentMethod.onlineLabel.addTarget(presenter, action: #selector(presenter.setupPayment(_:)), for: .touchUpInside)
    }
    
    private func setupTopBar() {
        topBar.button.addTarget(presenter, action: #selector(presenter.backButton), for: .touchUpInside)
        topBar.title.text = "Доставка"
        self.view.insertSubview(topBar, at: 0)
    }
    
    private func setupScroll() {
        self.view.backgroundColor = .white
        
        scroll.layer.cornerRadius = 15
        scroll.backgroundColor = .white
        scroll.showsVerticalScrollIndicator = false
        
        self.view.insertSubview(scroll, at: 0)
        
        setupMap()
        setupAdress()
        setupApartment()
        setupFloor()
        setupDoorCode()
        setupEntrance()
        setupPhone()
        setupComents()
        setupPriceLabel()
        setupPrice()
        setupDeliveryLabel()
        setupDelivery()
        setupTotalLabel()
        setupDiscountLabel()
        setupDiscount()
        setupTotal()
        setupLongButton()
        setupShortLabel()
        setupCodeButton()
        setupPayButton()
    }
    
    private func setupDiscountLabel() {
        discountLabel.text = "Cкидка"
        discountLabel.font = UIFont(name: "Montserrat-Regular", size: 18)
        discountLabel.textColor = .black
        discountLabel.textAlignment = .left
        scroll.addSubview(discountLabel)
        discountLabel.isHidden = true
    }
    
    private func setupDiscount() {
        discount.text = "\(presenter.discount) р"
        discount.font = UIFont(name: "Montserrat-Regular", size: 18)
        discount.textColor = .black
        discount.textAlignment = .right
        scroll.addSubview(discount)
        discount.isHidden = true
    }
    
    private func setupPayButton() {
        payButton.setTitle("Оплатить", for: .normal)
        payButton.setTitleColor(.white, for: .normal)
        payButton.backgroundColor = .black
        payButton.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 18)
        payButton.layer.cornerRadius = 15
        scroll.addSubview(payButton)
        payButton.addTarget(presenter, action: #selector(presenter.orderButton), for: .touchUpInside)
    }
    
    private func setupCodeButton() {
        codeButton.setTitle("Примените промокод", for: .normal)
        codeButton.setTitleColor(.black, for: .normal)
        codeButton.titleLabel?.lineBreakMode = .byWordWrapping
        codeButton.titleLabel?.numberOfLines = 0
        codeButton.backgroundColor = .clear
        codeButton.titleLabel?.textAlignment = .center
        codeButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 18)
        codeButton.backgroundColor = .clear
        codeButton.layer.cornerRadius = 15
        codeButton.layer.borderWidth = 1
        codeButton.layer.borderColor = UIColor(red: 0.365, green: 0.843, blue: 0.604, alpha: 1).cgColor
        scroll.addSubview(codeButton)
        codeButton.addTarget(presenter, action: #selector(presenter.codeButton), for: .touchUpInside)
    }
    
    private func setupShortLabel() {
        shortButton.topLabel.text = "Способ оплаты"
        shortButton.botLabel.text = "Онлайн"
        scroll.addSubview(shortButton)
        shortButton.addTarget(presenter, action: #selector(presenter.paymentMethodButton), for: .touchUpInside)
    }
    
    private func setupLongButton() {
        longButton.topLabel.text = "Время доставки"
        longButton.botLabel.text = "Как можно скорее"
        scroll.addSubview(longButton)
        longButton.addTarget(presenter, action: #selector(presenter.deliveryButton), for: .touchUpInside)
    }
    
    private func setupTotal() {
        total.text = "\(presenter.total) р"
        total.font = UIFont(name: "Montserrat-Medium", size: 22)
        total.textColor = .black
        total.textAlignment = .right
        scroll.addSubview(total)
    }
    
    private func setupTotalLabel() {
        totalLabel.text = "Итого"
        totalLabel.font = UIFont(name: "Montserrat-Medium", size: 22)
        totalLabel.textColor = .black
        totalLabel.textAlignment = .left
        scroll.addSubview(totalLabel)
    }
    
    private func setupDelivery() {
        delivery.text = "\(presenter.delivery) р"
        delivery.font = UIFont(name: "Montserrat-Regular", size: 18)
        delivery.textColor = .black
        delivery.textAlignment = .right
        scroll.addSubview(delivery)
    }
    
    private func setupDeliveryLabel() {
        deliveryLabel.text = "Доставка"
        deliveryLabel.font = UIFont(name: "Montserrat-Regular", size: 18)
        deliveryLabel.textColor = .black
        deliveryLabel.textAlignment = .left
        scroll.addSubview(deliveryLabel)
    }
    
    private func setupPrice() {
        price.text = "\(presenter.price) p"
        price.font = UIFont(name: "Montserrat-Regular", size: 18)
        price.textColor = .black
        price.textAlignment = .right
        scroll.addSubview(price)
    }
    
    private func setupPriceLabel() {
        priceLabel.text = "Стоимость"
        priceLabel.font = UIFont(name: "Montserrat-Regular", size: 18)
        priceLabel.textColor = .black
        priceLabel.textAlignment = .left
        scroll.addSubview(priceLabel)
    }
    
    private func setupComents() {
        setupTextfield(comments.textField, placeholder: "Коментарий", keyboard: .default, size: 20)
        comments.textField.textAlignment = .left
        scroll.addSubview(comments)
    }
    
    private func setupPhone() {
        setupTextfield(phone.textField, placeholder: "Телефон", keyboard: .phonePad, size: 20)
        phone.textField.textAlignment = .left
        scroll.addSubview(phone)
    }
    
    private func setupEntrance() {
        setupTextfield(entranse.textField, placeholder: "Подъезд", keyboard: .numberPad, size: 12)
        entranse.textField.textAlignment = .left
        scroll.addSubview(entranse)
    }
    
    private func setupDoorCode() {
        setupTextfield(doorCode.textField, placeholder: "Домофон", keyboard: .numberPad, size: 12)
        doorCode.textField.textAlignment = .left
        scroll.addSubview(doorCode)
    }
    
    private func setupFloor() {
        setupTextfield(floor.textField, placeholder: "Этаж", keyboard: .numberPad, size: 12)
        floor.textField.textAlignment = .left
        scroll.addSubview(floor)
    }
    
    private func setupApartment() {
        setupTextfield(apartment.textField, placeholder: "Кв/Офис", keyboard: .numberPad, size: 12)
        apartment.textField.textAlignment = .left
        scroll.addSubview(apartment)
    }
    
    private func setupAdress() {
        setupTextfield(adress.textField, placeholder: "Введите адрес", keyboard: .default, size: 24)
        adress.textField.textAlignment = .center
        scroll.addSubview(adress)
    }
    
    private func setupMap() {
        mapView.layer.cornerRadius = 15
        mapView.isUserInteractionEnabled = false
        scroll.addSubview(mapView)
    }
    
    func setupTextfield(_ textField: UITextField, placeholder: String, keyboard: UIKeyboardType, size: CGFloat) {
        textField.keyboardType = keyboard
        textField.placeholder = placeholder
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.font = UIFont(name: "Montserrat-Regular", size: size)
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func setupConstraints() {
        
        topBar.translatesAutoresizingMaskIntoConstraints = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        adress.translatesAutoresizingMaskIntoConstraints = false
        apartment.translatesAutoresizingMaskIntoConstraints = false
        doorCode.translatesAutoresizingMaskIntoConstraints = false
        entranse.translatesAutoresizingMaskIntoConstraints = false
        floor.translatesAutoresizingMaskIntoConstraints = false
        phone.translatesAutoresizingMaskIntoConstraints = false
        comments.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        price.translatesAutoresizingMaskIntoConstraints = false
        deliveryLabel.translatesAutoresizingMaskIntoConstraints = false
        delivery.translatesAutoresizingMaskIntoConstraints = false
        discountLabel.translatesAutoresizingMaskIntoConstraints = false
        discount.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        total.translatesAutoresizingMaskIntoConstraints = false
        longButton.translatesAutoresizingMaskIntoConstraints = false
        shortButton.translatesAutoresizingMaskIntoConstraints = false
        codeButton.translatesAutoresizingMaskIntoConstraints = false
        payButton.translatesAutoresizingMaskIntoConstraints = false
        paymentMethod.translatesAutoresizingMaskIntoConstraints = false
        codeAlert.translatesAutoresizingMaskIntoConstraints = false
        dateAlert.translatesAutoresizingMaskIntoConstraints = false
    
        [
            self.topBar.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.topBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.topBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.topBar.heightAnchor.constraint(equalToConstant: hundredfive - twentyUp),
            
            self.scroll.topAnchor.constraint(equalTo: self.topBar.bottomAnchor, constant: 20),
            self.scroll.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.scroll.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            self.scroll.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            
            mapView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            mapView.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            mapView.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 40),
            mapView.heightAnchor.constraint(equalToConstant: hundredfive * 2),
            
            adress.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            adress.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            adress.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 15),
            adress.heightAnchor.constraint(equalToConstant: 30),
            
            apartment.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            apartment.topAnchor.constraint(equalTo: adress.bottomAnchor, constant: fiftyUp),
            apartment.widthAnchor.constraint(equalToConstant: (screenWidth - 60) / 4 ),
            apartment.heightAnchor.constraint(equalToConstant: 26),
            
            floor.leadingAnchor.constraint(equalTo: apartment.trailingAnchor, constant: 10),
            floor.topAnchor.constraint(equalTo: apartment.topAnchor),
            floor.widthAnchor.constraint(equalTo: apartment.widthAnchor),
            floor.heightAnchor.constraint(equalTo: apartment.heightAnchor),
            
            doorCode.leadingAnchor.constraint(equalTo: floor.trailingAnchor, constant: 10),
            doorCode.topAnchor.constraint(equalTo: apartment.topAnchor),
            doorCode.widthAnchor.constraint(equalTo: apartment.widthAnchor),
            doorCode.heightAnchor.constraint(equalTo: apartment.heightAnchor),
            
            entranse.leadingAnchor.constraint(equalTo: doorCode.trailingAnchor, constant: 10),
            entranse.topAnchor.constraint(equalTo: apartment.topAnchor),
            entranse.widthAnchor.constraint(equalTo: apartment.widthAnchor),
            entranse.heightAnchor.constraint(equalTo: apartment.heightAnchor),
            
            phone.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            phone.topAnchor.constraint(equalTo: apartment.bottomAnchor, constant: fiftyUp),
            phone.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            phone.heightAnchor.constraint(equalTo: apartment.heightAnchor),
            
            comments.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: fiftyUp),
            comments.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            comments.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            comments.heightAnchor.constraint(equalTo: phone.heightAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: comments.bottomAnchor, constant: fiftyUp),
            priceLabel.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            priceLabel.widthAnchor.constraint(equalTo: scroll.widthAnchor, multiplier: 0.5),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            price.topAnchor.constraint(equalTo: priceLabel.topAnchor),
            price.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            price.trailingAnchor.constraint(equalTo: total.trailingAnchor),
            price.heightAnchor.constraint(equalTo: priceLabel.heightAnchor),
            
            deliveryLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: thirtyUp),
            deliveryLabel.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            deliveryLabel.widthAnchor.constraint(equalTo: priceLabel.widthAnchor),
            deliveryLabel.heightAnchor.constraint(equalTo: priceLabel.heightAnchor),
            
            delivery.topAnchor.constraint(equalTo: deliveryLabel.topAnchor),
            delivery.leadingAnchor.constraint(equalTo: deliveryLabel.leadingAnchor),
            delivery.trailingAnchor.constraint(equalTo: total.trailingAnchor),
            delivery.heightAnchor.constraint(equalTo: priceLabel.heightAnchor),
            
            discountLabel.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: thirtyUp),
            discountLabel.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            discountLabel.widthAnchor.constraint(equalTo: deliveryLabel.widthAnchor),
            discountLabel.heightAnchor.constraint(equalTo: priceLabel.heightAnchor),
            
            discount.topAnchor.constraint(equalTo: discountLabel.topAnchor),
            discount.leadingAnchor.constraint(equalTo: discountLabel.leadingAnchor),
            discount.trailingAnchor.constraint(equalTo: total.trailingAnchor),
            discount.heightAnchor.constraint(equalTo: priceLabel.heightAnchor),
            
            totalLabel.topAnchor.constraint(equalTo: discountLabel.bottomAnchor, constant: thirtyUp),
            totalLabel.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            totalLabel.widthAnchor.constraint(equalTo: deliveryLabel.widthAnchor),
            totalLabel.heightAnchor.constraint(equalToConstant: 25),
            
            total.topAnchor.constraint(equalTo: totalLabel.topAnchor),
            total.leadingAnchor.constraint(equalTo: totalLabel.trailingAnchor),
            total.widthAnchor.constraint(equalTo: totalLabel.widthAnchor),
            total.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            
            longButton.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: thirtyUp),
            longButton.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            longButton.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            longButton.heightAnchor.constraint(equalToConstant: 66),
            
            shortButton.topAnchor.constraint(equalTo: longButton.bottomAnchor, constant: 23),
            shortButton.leadingAnchor.constraint(equalTo: longButton.leadingAnchor),
            shortButton.widthAnchor.constraint(equalTo: scroll.widthAnchor, multiplier: 0.48),
            shortButton.heightAnchor.constraint(equalTo: longButton.heightAnchor),
            
            codeButton.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            codeButton.topAnchor.constraint(equalTo: shortButton.topAnchor),
            codeButton.widthAnchor.constraint(equalTo: shortButton.widthAnchor),
            codeButton.heightAnchor.constraint(equalTo: shortButton.heightAnchor),
            
            payButton.topAnchor.constraint(equalTo: shortButton.bottomAnchor, constant: 23),
            payButton.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            payButton.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            payButton.heightAnchor.constraint(equalTo: codeButton.heightAnchor),
            payButton.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            payButton.bottomAnchor.constraint(equalTo: scroll.bottomAnchor, constant: -15),
            
            paymentMethod.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            paymentMethod.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            paymentMethod.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            paymentMethod.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            
            codeAlert.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            codeAlert.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            codeAlert.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            codeAlert.heightAnchor.constraint(equalTo: self.view.heightAnchor),

            dateAlert.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            dateAlert.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            dateAlert.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            dateAlert.heightAnchor.constraint(equalTo: self.view.heightAnchor),

        ].forEach {
            $0.isActive = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
    
}


extension DeliveryViewController: UITextFieldDelegate {
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            if textField == adress {
                presenter.adress = text
            } else if textField == apartment {
                presenter.apartment = text
            } else if textField == floor {
                presenter.floor = text
            } else if textField == doorCode {
                presenter.doorCode = text
            } else if textField == entranse {
                presenter.entrance = text
            } else if textField == phone {
                presenter.phone = text
            } else if textField == comments {
                presenter.comments = text
            } else if textField == codeAlert.textfield {
                presenter.code = text
            }
        }
    }
    
}


extension DeliveryViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 2
        }
            
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            let date = Date(timeInterval: 1000000, since: Date())
            if component == 0 {
                return "\(date.convertToDay())"
            } else {
                return "\(date.convertToMinutes())"
            }
        }
}

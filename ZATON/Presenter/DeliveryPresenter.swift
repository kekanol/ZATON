//
//  DeliveryPresenter.swift
//  ZATON
//
//  Created by Константин on 14.04.2021.
//

import UIKit

final class DeliveryPresenter {
    
    weak var view : DeliveryViewController?
    
    var coordinates: String = "" // TODO
    var adress: String = ""
    var apartment: String = ""
    var floor: String = ""
    var doorCode: String = ""
    var entrance: String = ""
    var phone: String = ""
    var comments: String = ""
    
    var price: Float = 0 {
        didSet {
            self.view?.price.text = "\(price) p"
            total = price + delivery - discount
        }
    }
    
    var delivery: Float = 0 {
        didSet {
            self.view?.delivery.text = "\(delivery) p"
            total = price + delivery - discount
        }
    }
    
    var discount: Float = 0 {
        didSet {
            if discount != 0 {
                self.view?.discount.isHidden = false
                self.view?.discountLabel.isHidden = false
            } else {
                self.view?.discount.isHidden = true
                self.view?.discountLabel.isHidden = true
            }
            self.view?.discount.text = "\(discount) p"
            total = price + delivery - discount
        }
    }
    
    var total: Float = 0 {
        didSet {
            self.view?.total.text = "\(total) p"
        }
    }

    var dateArray: [Date] = []
    var minutesArray: [Date] = []
    
    var currentDateIndex : Int? {
        didSet {
            if currentDateIndex != nil {
                view?.dateAlert.date = "\(dateArray[currentDateIndex!])"
            }
        }
    }
    
    var asFastAsPossible: Bool = true
    var toTime: String?
    var isOnline: Bool = true
    
    var paymentMethod: String = "" {
        didSet {
            if paymentMethod == "Картой онлайн" {
                view?.payButton.setTitle("Оплатить", for: .normal)
                view?.shortButton.botLabel.text = "Онлайн"
                isOnline = true
            } else if paymentMethod == "Картой курьеру"  {
                view?.payButton.setTitle("Заказать", for: .normal)
                view?.shortButton.botLabel.text = "Картой"
                isOnline = false
            } else if paymentMethod == "Наличными"  {
                view?.payButton.setTitle("Заказать", for: .normal)
                view?.shortButton.botLabel.text = "Наличными"
                isOnline = false
            }
        }
    }
    
    var code: String? {
        didSet {
            if code != nil {
                if code != "" {
                    view?.codeButton.setTitle(code!, for: .normal)
                } else {
                    view?.codeButton.setTitle("Примените промокод", for: .normal)
                }
                if code == "1111" {
                    discount = 200
                } else {
                    discount = 0
                }
            }
        }
    }
    
    var products: [Product] = []
    
    @objc func backButton() {
        self.view?.dismiss(animated: true)
    }
    
    @objc func orderButton() {
        print("order")
    }
    
    @objc func deliveryButton() {
        self.view?.dateAlert.isHidden = false
    }
    
    @objc func paymentMethodButton() {
        view?.paymentMethod.isHidden = false
    }
    
    @objc func codeButton() {
        self.view?.codeAlert.isHidden = false
        self.view?.codeAlert.textfield.becomeFirstResponder()
    }
    
    @objc func codeAlertButton() {
        self.code = self.view?.codeAlert.textfield.text
        self.view?.codeAlert.isHidden = true
    }
    
    @objc func setupPayment(_ sender: UIButton) {
        let text = sender.titleLabel!.text!
        self.paymentMethod = text
        view?.paymentMethod.isHidden = true
    }
    
    @objc func timeButton() {
        self.asFastAsPossible = view!.dateAlert.asSoon
        if asFastAsPossible {
            view?.longButton.botLabel.text = "Как можно скорее"
            toTime = nil
        } else {
            toTime = view?.dateAlert.date
            view?.longButton.botLabel.text = toTime
        }
        view?.dateAlert.isHidden = true
    }
    
    @objc func leftButton() {
        view?.dateAlert.asSoon = true
    }
    
    @objc func rightButton() {
        view?.dateAlert.asSoon = false
    }
}

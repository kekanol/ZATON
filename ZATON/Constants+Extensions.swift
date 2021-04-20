//
//  Constants+Extensions.swift
//  ZATON
//
//  Created by Константин on 13.04.2021.
//
import UIKit
import Foundation

let screenSize = UIScreen.main.bounds
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

let thirtyUp = screenHeight / 30
let thirtyRight = screenWidth / 13.8
let twentyUp = screenHeight / 45
let twentyright = screenWidth / 20.7
let thirty7Up = screenHeight / 24.2
let thirty7Right = screenWidth / 11.1
let hundredfive = screenHeight / 8.5
let fiftyUp = screenHeight / 19
let fourtyUp = screenHeight / 22.4
let sixtyUp = screenHeight / 15
let seventyUp = screenHeight / 11.8
let horizontalcellheight = screenHeight / 5
let alertWidth = screenWidth * 0.9


extension Float {
    var convertToTwo: Float {(self * 100).rounded() / 100}
}


extension Date {
    
    func convertToDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.doesRelativeDateFormatting = true
        return dateFormatter.string(from: self)
    }
    
    func convertToMinutes() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh : mm"
        return dateFormatter.string(from: self)
    }
}

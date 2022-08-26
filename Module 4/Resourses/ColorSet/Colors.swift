//
//  Colors.swift
//  Module 4
//
//  Created by Влад Бокин on 26.08.2022.
//

import UIKit

// MARK: - RGB extension
extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

let mainGreenColor = UIColor.rgb(r: 102, g: 166, b: 54)
let lightOliveGreenColor = UIColor.rgb(r: 158, g: 191, b: 80)
let lightGreyColor = UIColor.rgb(r: 234, g: 237, b: 232)
let charcoalGreyColor = UIColor.rgb(r: 73, g: 74, b: 74)
let whiteColor = UIColor.rgb(r: 255, g: 255, b: 255)


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
    
    //Mark: - Colors
    static var mainGreenColor: UIColor {
        return UIColor.rgb(r: 102, g: 166, b: 54)
    }
    static var lightOliveGreenColor: UIColor {
        return UIColor.rgb(r: 158, g: 191, b: 80)
    }
    static var lightGreyColor: UIColor {
        return UIColor.rgb(r: 232, g: 237, b: 237)
    }
    static var charcoalGreyColor: UIColor {
        return UIColor.rgb(r: 73, g: 74, b: 74)
    }
    static var whiteColor: UIColor {
        return UIColor.rgb(r: 255, g: 255, b: 255)
    }
    static var blueGrey: UIColor {
        return UIColor.rgb(r: 98, g: 127, b: 143)
    }
    static var darkSlateBlue: UIColor {
        return UIColor.rgb(r: 22, g: 59, b: 79)
    }
    static var greyColor: UIColor {
        return UIColor.rgb(r: 148, g: 153, b: 138)
    }
    static var warmGreyColor: UIColor {
        return UIColor.rgb(r: 146, g: 146, b: 146)
    }

}


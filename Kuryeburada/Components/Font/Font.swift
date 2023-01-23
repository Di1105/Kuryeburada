//
//  Font.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 22.01.2023.
//

import UIKit


final class Font {
    enum FontWeight {
        case light
        case regular
        case medium
        case semibold
        case bold
    }

    static func custom(size: Float, fontWeight: FontWeight) -> UIFont {
        return UIFont(name: "Poppins-\(fontWeight)",
                      size: CGFloat(size))!
    }

    static func buttonTitle() -> UIFont {
        return UIFont(name: "Poppins-Bold", size: 16)!
    }

    static func labelHeader() -> UIFont {
        return UIFont(name: "Poppins-Bold", size: 16)!
    }
    
    static func labelText() -> UIFont {
        return UIFont(name: "Poppins-Bold", size: 14 )!
    }
    
    static func textField() -> UIFont {
        return UIFont(name: "Poppins-Medium", size: 14)!
    }
    
    static func header1() -> UIFont {
        return UIFont(name: "Poppins-Bold", size: 22)!
    }

    static func header2() -> UIFont {
        return UIFont(name: "Poppins-Bold", size: 18)!
    }

    static func header3() -> UIFont {
        return UIFont(name: "Poppins-Bold", size: 16)!
    }
    
    static func labelFont() -> UIFont {
        return UIFont(name: "Poppins-Medium", size: 16)!
    }
    
    static func textFont() -> UIFont {
        return UIFont(name: "Poppins-Medium", size: 14)!
    }
    
    static func IntroNormal() -> UIFont {
        return UIFont(name: "Poppins-Bold", size: 32)!
    }
    
    static func header4() -> UIFont {
        return UIFont(name: "Poppins-Bold", size: 14)!
    }
}


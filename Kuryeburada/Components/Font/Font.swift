//
//  CustomFont.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 9.01.2023.
//

import UIKit

class Font: UIFont {
    
    enum FontWeight {
        case light
        case regular
        case medium
        case semibold
        case bold
    }

    static func custom(size: CGFloat , fontWeight: FontWeight ) -> UIFont {
        return UIFont(name: "Poppins-\(fontWeight)",
                      size: size )!
    }

    static func header1() -> UIFont {
        return UIFont(name: "Poppins-Bold", size: 20)!
    }

    static func header2() -> UIFont {
        return UIFont(name: "Poppins-Bold", size: 18)!
    }

    static func header3() -> UIFont {
        return UIFont(name: "Poppins-Bold", size: 16)!
    }
    
    static func textField() -> UIFont {
        return UIFont(name: "Poppins-Regular", size: 14)!
    }
    
}

//
//  Customr.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 10.01.2023.
//

import UIKit
import SnapKit

class CustomIntroTextView: UITextView {

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: .zero, textContainer: textContainer)
        configureUI()
    }
       
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()

    }
    
    init(frame: CGRect, text: String) {
        super.init(frame: CGRect.zero, textContainer: nil)
        configureUI()
        self.text = text
        
    }
       
    func configureUI(){
        snp.makeConstraints { make in
            make.height.equalTo(160)
        }
        textAlignment = .center
        backgroundColor = .white
        font = Font.IntroNormal()
        textColor = .primaryDarkBlue
        isEditable = false
     
    }
    
}

//
//  CustomNonEditText.swift
//  Geyim Burada
//
//  Created by Dilara Elçioğlu on 9.01.2023.
//

import UIKit
import SnapKit

class CustomNonEditTextView: UITextView {
    
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
        backgroundColor = .white
        font = Font.textField()
        textColor = .primaryGray
        isEditable = false
     
    }
    
}

//
//  CustomTextView.swift
//  Geyim Burada
//
//  Created by Dilara Elçioğlu on 8.01.2023.
//

import UIKit
import SnapKit

class CustomEditableTextView: UITextView {

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: .zero, textContainer: textContainer)
        configureUI()
    }
       
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()

    }
       
    func configureUI(){
        snp.makeConstraints { make in
            make.height.equalTo(160)
        }
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.primaryGray?.cgColor
        backgroundColor = .white
        font = Font.textField()
        textColor = .primaryGray
     
    }
    
}

//
//  CustomSecondaryLittleButton.swift
//  Geyim Burada
//
//  Created by Dilara Elçioğlu on 9.01.2023.
//

import UIKit

class CustomSecondarySmallButton: UIButton {

    var buttonTitle = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String) {
        super.init(frame: .zero)
        self.buttonTitle.text = title
        configureUI()
    }
    
    private func configureUI() {

        addSubview(buttonTitle)
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.primaryGray?.cgColor
        backgroundColor = .white
        buttonTitle.numberOfLines = 2
        buttonTitle.textColor = .primaryGray
        buttonTitle.font = Font.header3()
        buttonTitle.snp.makeConstraints { make in
            make.center.equalToSuperview()
            
        }
        
        snp.makeConstraints { make in
            make.height.equalTo(56)
            make.width.equalTo(100)
        }
        
        
    }
    

}

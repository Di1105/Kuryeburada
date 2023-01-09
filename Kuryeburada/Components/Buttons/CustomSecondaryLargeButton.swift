//
//  CustomSecondaryLargeButton.swift
//  Geyim Burada
//
//  Created by Dilara Elçioğlu on 9.01.2023.
//

import UIKit

class CustomSecondaryLargeButton: UIButton {

    var buttonSTitle = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String) {
        super.init(frame: .zero)
        self.buttonSTitle.text = title
        configureUI()
    }
    
    private func configureUI() {

        addSubview(buttonSTitle)
        buttonSTitle.numberOfLines = 2
        buttonSTitle.textColor = .primaryGray
        buttonSTitle.font = Font.header3()
        buttonSTitle.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.primaryGray?.cgColor
        backgroundColor = .white
        
    }
    

}

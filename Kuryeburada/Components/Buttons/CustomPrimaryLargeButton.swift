//
//  CustomButton.swift
//  Geyim Burada
//
//  Created by Dilara Elçioğlu on 5.01.2023.
//

import UIKit
import SnapKit

class CustomPrimaryLargeButton: UIButton {
    
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
        buttonTitle.numberOfLines = 2
        buttonTitle.textColor = .white
        buttonTitle.font = Font.header3()
        buttonTitle.snp.makeConstraints { make in
            make.center.equalToSuperview()
            
        }
        
        snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        backgroundColor = .primaryGreen
        layer.cornerRadius = 10
       
        
    }
    

}

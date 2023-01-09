//
//  CustomNormalLabelHeader.swift
//  Geyim Burada
//
//  Created by Dilara Elçioğlu on 9.01.2023.
//

import UIKit

class CustomNormalHeadLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text : String ) {
        super.init(frame: .zero)
        configureUI()
        self.text = text
        
    }
    

    func configureUI(){
        snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        backgroundColor = .white
        font = Font.custom(size: 14, fontWeight: .bold) //Poppins-bold size 14
        textColor = .primaryGray
        
        
    }
}

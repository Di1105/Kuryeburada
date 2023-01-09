//
//  CustomSearchBar.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 9.01.2023.
//

import UIKit
import SnapKit

class CustomSearchBar: UISearchBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(placeholder : String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        configure()
    }
    
    
    private func configure(){
        snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.primaryGray?.cgColor
        backgroundColor = .white
        searchTextField.textColor = .primaryDarkBlue
        searchTextField.font = Font.textField()
        searchBarStyle = UISearchBar.Style.minimal
        isTranslucent = false
        barStyle = .default
        searchTextField.borderStyle = .bezel
        barTintColor = .white
        
    }
    
}

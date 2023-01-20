//
//  CustomSearchBar.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 9.01.2023.
//

import UIKit
import SnapKit

class CustomSearchBar: UISearchBar {

    lazy var barkodImage = UIImageView()

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
    
    init(placeholder : String , leftIcon: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        configure()
        barkodImage.image = UIImage(named: leftIcon)
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
        
        addSubview(barkodImage)
        barkodImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
    }
    
}

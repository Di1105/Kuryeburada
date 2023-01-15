//
//  CustomRememberButton.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 15.01.2023.
//

import UIKit
import SnapKit

class CustomRememberButton: UIButton {

    lazy var rememberBoxImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        congfigureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func congfigureUI(){
        
        backgroundColor = .white
        snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        
        lazy var rememberLabel = UILabel()
        addSubview(rememberLabel)
        rememberLabel.backgroundColor = .white
        rememberLabel.text = "Remember me"
        rememberLabel.font = Font.labelFont()
        rememberLabel.textColor = .primaryDarkBlue
        rememberLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(8)
            make.height.equalTo(20)
        }
        
        addSubview(rememberBoxImage)
        rememberBoxImage.layer.cornerRadius = 5
        rememberBoxImage.backgroundColor = .white
        rememberBoxImage.layer.borderWidth = 2
        rememberBoxImage.layer.masksToBounds = false
        rememberBoxImage.clipsToBounds = true
        rememberBoxImage.contentMode = .scaleAspectFill
        rememberBoxImage.layer.borderColor = UIColor.primaryGreen?.cgColor
        rememberBoxImage.snp.makeConstraints { make in
            make.centerY.equalTo(rememberLabel)
            make.width.height.equalTo(20)
            make.trailing.equalTo(rememberLabel.snp.leading).offset(-8)
        }
        
    }
    @objc func buttonTapped(){
        if rememberBoxImage.image == nil{
            rememberBoxImage.image = UIImage(named: "tik2")
        }else{
            rememberBoxImage.image = nil
        }
    }
}

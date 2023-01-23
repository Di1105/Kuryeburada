//
//  CustomProfileVCButton2.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 23.01.2023.
//

import UIKit
import SnapKit

class CustomProfileVCButton: UIButton {
    
    lazy var leftButtonImg = UIImageView()
    lazy var buttonLabel1 = UILabel()
    lazy var rightButtonImg = UIImageView()
    lazy var buttonLabel2 = UILabel()


    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(leftButtonImage: String, buttonLabel1: String, buttonLabel2: String, rightButtonImg: String){
        super.init(frame: .zero)
        configureUI()
        self.leftButtonImg.image = UIImage(named: "\(leftButtonImage)")
        self.buttonLabel1.text = buttonLabel1
        self.buttonLabel2.text = buttonLabel2
        self.rightButtonImg.image = UIImage(named: "\(rightButtonImg)")
    }
    
    private func configureUI(){
        
        
        backgroundColor = .white
        snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        addSubview(leftButtonImg)
       // leftButtonImg.layer.cornerRadius = 12
        leftButtonImg.layer.masksToBounds = false
        leftButtonImg.clipsToBounds = true
        leftButtonImg.tintColor = .primaryDarkBlue
        leftButtonImg.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        addSubview(buttonLabel1)
        buttonLabel1.textColor = .primaryDarkBlue
        buttonLabel1.font = Font.labelFont()
        buttonLabel1.snp.makeConstraints { make in
            make.leading.equalTo(leftButtonImg.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
        }
        
        addSubview(rightButtonImg)
        rightButtonImg.layer.cornerRadius = 32
        rightButtonImg.layer.masksToBounds = false
        rightButtonImg.clipsToBounds = true
        rightButtonImg.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
        
        addSubview(buttonLabel2)
        buttonLabel2.textColor = .primaryDarkBlue
        buttonLabel2.font = Font.labelFont()
        buttonLabel2.snp.makeConstraints { make in
            make.trailing.equalTo(rightButtonImg.snp.leading).offset(-8)
            make.centerY.equalToSuperview()
        }
        
    }
    
    @objc func buttonTapped(_ sender: UIButton){
        if sender.layer.borderColor == UIColor.primaryGray?.cgColor{
            sender.layer.borderColor = UIColor.primaryGreen?.cgColor
        } else {
            sender.layer.borderColor = UIColor.primaryGray?.cgColor
        }
    }
}

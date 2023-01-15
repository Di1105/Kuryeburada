//
//  CustomHomeButton.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 16.01.2023.
//

import UIKit
import SnapKit

class CustomHomeVCButton: UIButton {

    lazy var buttonImg = UIImageView()
    lazy var buttonLbl = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(buttonImage: String, buttonLabel: String){
        super.init(frame: .zero)
        configureUI()
        buttonImg.image = UIImage(named: "\(buttonImage)")
        buttonLbl.text = buttonLabel
        
    }
    
    private func configureUI(){
        
        layer.masksToBounds = true
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.primaryGray?.cgColor
        clipsToBounds = true
        backgroundColor = .white
        snp.makeConstraints { make in
            make.height.equalTo(120)
        }
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        addSubview(buttonImg)
        buttonImg.layer.cornerRadius = 32
        buttonImg.layer.masksToBounds = false
        buttonImg.clipsToBounds = true
        buttonImg.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16)
            make.width.height.equalTo(64)
        }
        
        addSubview(buttonLbl)
        buttonLbl.textColor = .primaryDarkBlue
        buttonLbl.font = Font.labelFont()
        buttonLbl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
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

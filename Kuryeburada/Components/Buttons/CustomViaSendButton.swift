//
//  CustomViaSendButton.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 15.01.2023.
//

import UIKit
import SnapKit

class CustomViaSendButton: UIButton {

    lazy var viaSendImage = UIImageView()
    lazy var viaSendLabel = UILabel()
    lazy var viaSendTo = UILabel()


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(labelText: String, sendTo: String, sendImage: String ){
        super.init(frame: .zero)
        configureUI()
        viaSendLabel.text = labelText
        viaSendTo.text = sendTo
        viaSendImage.image = UIImage(named: "\(sendImage)")
    }
    
    private func configureUI(){
        
        backgroundColor = .white
        layer.borderWidth = 1
        layer.cornerRadius = 20
        layer.borderColor = UIColor.primaryGray?.cgColor
        snp.makeConstraints { make in
            make.height.equalTo(96)
        }
        addTarget(self, action: #selector(sendMsg), for: .touchUpInside)
        
        addSubview(viaSendImage)
        viaSendImage.backgroundColor = .primaryLightBack
        viaSendImage.layer.masksToBounds = false
        viaSendImage.layer.borderColor = UIColor.primaryLightBack?.cgColor
        viaSendImage.layer.cornerRadius = 30
        viaSendImage.clipsToBounds = true
        viaSendImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(60)
        }
        
        addSubview(viaSendLabel)
        viaSendLabel.textColor = .primaryGray
        viaSendLabel.font = Font.labelFont()
        viaSendLabel.snp.makeConstraints { make in
            make.leading.equalTo(viaSendImage.snp.trailing).offset(16)
            make.top.equalToSuperview().offset(24)
        }
        
        addSubview(viaSendTo)
        viaSendTo.textColor = .primaryDarkBlue
        viaSendTo.font = Font.header3()
        viaSendTo.snp.makeConstraints { make in
            make.leading.equalTo(viaSendImage.snp.trailing).offset(16)
            make.bottom.equalToSuperview().offset(-24)
        }

    }
    
    @objc func sendMsg(){
        self.layer.borderColor = UIColor.primaryGreen?.cgColor
        // send SMS
        
    }
    
}

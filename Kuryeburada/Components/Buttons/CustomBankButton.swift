//
//  CustomBankButton.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 16.01.2023.
//

import UIKit
import SnapKit

class CustomBankButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        
        layer.masksToBounds = true
        layer.cornerRadius = 20
        clipsToBounds = true
        backgroundColor = .secondaryGreen
        snp.makeConstraints { make in
            make.height.equalTo(160)
        }
        
        lazy var nameLabel = UILabel()
        addSubview(nameLabel)
        nameLabel.text = "Angela Lina Lewstone"
        nameLabel.lineBreakMode = .byCharWrapping
        nameLabel.numberOfLines = 2
        nameLabel.textColor = .white
        nameLabel.font = Font.header2()
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-124)
        }
        
        lazy var bankNoLabel = UILabel()
        addSubview(bankNoLabel)
        bankNoLabel.text = "************6093"
        bankNoLabel.textColor = .white
        bankNoLabel.font = Font.labelFont()
        bankNoLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.equalTo(nameLabel)
        }
        
        lazy var amountLabel = UILabel()
        addSubview(amountLabel)
        amountLabel.text = "$4,768"
        amountLabel.textColor = .white
        amountLabel.font = Font.IntroNormal()
        amountLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16)
            make.leading.equalTo(nameLabel)
        }
        
        lazy var balanceLabel = UILabel()
        addSubview(balanceLabel)
        balanceLabel.text = "Your balance"
        balanceLabel.textColor = .white
        balanceLabel.font = Font.labelFont()
        balanceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(amountLabel.snp.top).offset(-8)
            make.leading.equalTo(nameLabel)
        }
        
        lazy var visaImage = UIImageView()
        addSubview(visaImage)
        visaImage.image = UIImage(named: "visa")
        visaImage.snp.makeConstraints { make in
            make.top.equalTo(nameLabel)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        lazy var topUpButton = UIButton()
        addSubview(topUpButton)
        topUpButton.setTitle("Top Up", for: .normal)
        topUpButton.setTitleColor(.secondaryGreen, for: .normal)
        topUpButton.backgroundColor = .white
        topUpButton.layer.cornerRadius = 15
        topUpButton.snp.makeConstraints { make in
            make.trailing.equalTo(visaImage)
            make.height.equalTo(visaImage)
            make.width.equalTo(visaImage)
            make.centerY.equalTo(amountLabel)
        }
    }
    
}

//
//  ForgotPasswordVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 12.01.2023.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI(){
        
        lazy var headerView = CustomHeaderView(leftButtonImage: "left", leftOneText: "Forgot Password", rightButtonIcon: "", currentVC: self, destinationVC: LogInAccountVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        lazy var infoLabel = UILabel()
        view.addSubview(infoLabel)
        infoLabel.text = "Select which contact should we use to \n reset your password"
        infoLabel.lineBreakMode = .byCharWrapping
        infoLabel.numberOfLines = 2
        infoLabel.font = Font.labelFont()
        infoLabel.textColor = .primaryDarkBlue
        infoLabel.textAlignment = .center
        infoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-16)
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var forgotImage = UIImageView()
        view.addSubview(forgotImage)
        forgotImage.image = UIImage(named: "logIn")
        forgotImage.snp.makeConstraints { make in
            make.bottom.equalTo(infoLabel.snp.top).offset(-32)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(160)
        }
        
        lazy var smsButton = CustomViaSendButton(labelText: "via SMS", sendTo: "+1 111 *****99", sendImage: "email")
        view.addSubview(smsButton)
        smsButton.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var emailButton = CustomViaSendButton(labelText: "via e-mail", sendTo: "ang***@gmail.com", sendImage: "email")
        view.addSubview(emailButton)
        emailButton.snp.makeConstraints { make in
            make.top.equalTo(smsButton.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var continueButton = CustomPrimaryLargeButton(title: "Continue", currentVC: self, destinationVC: SendPinVC())
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-32)
           }
    }


}

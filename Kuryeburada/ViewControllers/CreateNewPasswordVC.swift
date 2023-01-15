//
//  CreateNewPasswordVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 13.01.2023.
//

import UIKit

class CreateNewPasswordVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI(){
        
        lazy var headerView = CustomHeaderView(leftButtonImage: "left", leftOneText: "Create New Password", rightButtonIcon: "", currentVC: self, destinationVC: LogInAccountVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        lazy var continueButton = CustomPrimaryLargeButton(title: "Continue")
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-32)
        }
        continueButton.addTarget(self, action: #selector(gotoCongrats), for: .touchUpInside)
        
        lazy var infoLabel = UILabel()
        view.addSubview(infoLabel)
        infoLabel.text = "Create your new password"
        infoLabel.lineBreakMode = .byCharWrapping
        infoLabel.numberOfLines = 2
        infoLabel.font = Font.labelFont()
        infoLabel.textColor = .primaryDarkBlue
        infoLabel.textAlignment = .center
        infoLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
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
        
        lazy var firstPassword = CustomTextField(placeholder: "Password", leftImgName: "password", isSecureText: true)
        view.addSubview(firstPassword)
        firstPassword.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(32)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var secondPassword = CustomTextField(placeholder: "Password", leftImgName: "password", isSecureText: true)
        view.addSubview(secondPassword)
        secondPassword.snp.makeConstraints { make in
            make.top.equalTo(firstPassword.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var rememberButton = CustomRememberButton()
        view.addSubview(rememberButton)
        rememberButton.snp.makeConstraints { make in
            make.top.equalTo(secondPassword.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
  
    }
    
    
    @objc func gotoCongrats(){
        Presentation.presentAsPageSheet(currentVC: self, destinationVC: CongratsPopVC())
    }
}

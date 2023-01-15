//
//  CreateAccountVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 10.01.2023.
//

import UIKit
import SnapKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()

    }
    
    func setupUI(){
        
        lazy var headerView = CustomHeaderView(leftButtonImage: "left", middleHeaderText: "", currentVC: self, destinationVC: SignInVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        lazy var logInLabel = CustomIntroLabel(text: "Create your Account", color: .DarkBlue)
        view.addSubview(logInLabel)
        logInLabel.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            // make.width.equalTo(view.frame.size.width/2)
            
        }
        
        lazy var emailText = CustomTextField(placeholder: "Email", leftImgName: "email")
        view.addSubview(emailText)
        emailText.snp.makeConstraints { make in
            make.top.equalTo(logInLabel.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var passwordText = CustomTextField(placeholder: "Password", leftImgName: "password", isSecureText: true)
        view.addSubview(passwordText)
        passwordText.snp.makeConstraints { make in
            make.top.equalTo(emailText.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var rememberButton = CustomRememberButton()
        view.addSubview(rememberButton)
        rememberButton.snp.makeConstraints { make in
            make.top.equalTo(passwordText.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        lazy var signInSubButton = CustomBottomSignButton(labelText: "Already have an account?", buttonText: "Sign In", currentVC: self, destinationVC: LogInAccountVC())
        view.addSubview(signInSubButton)
        signInSubButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-24)
            make.centerX.equalToSuperview()
        }
        
        lazy var connectGoogle = CustomConnectionSmallButton(connectionLogo: .Google, currentVC: self, destinationVC: CreateAccountVC())
        view.addSubview(connectGoogle)
        connectGoogle.snp.makeConstraints { make in
            make.bottom.equalTo(signInSubButton.snp.top).offset(-32)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
        }

        
        lazy var connectApple = CustomConnectionSmallButton(connectionLogo: .Google, currentVC: self, destinationVC: CreateAccountVC())
        view.addSubview(connectApple)
        connectApple.snp.makeConstraints { make in
            make.leading.equalTo(connectGoogle.snp.trailing).offset(16)
            make.centerY.equalTo(connectGoogle)
            make.width.equalTo(80)
        }
        
        lazy var connectFacebook = CustomConnectionSmallButton(connectionLogo: .Facebook, currentVC: self, destinationVC: CreateAccountVC())
        view.addSubview(connectFacebook)
        connectFacebook.snp.makeConstraints { make in
            make.trailing.equalTo(connectGoogle.snp.leading).offset(-16)
            make.centerY.equalTo(connectGoogle)
            make.width.equalTo(80)
        }

        lazy var continueLabel = UILabel()
        view.addSubview(continueLabel)
        continueLabel.text = "or continue with"
        continueLabel.font = Font.labelFont()
        continueLabel.textColor = .primaryGray
        continueLabel.snp.makeConstraints { make in
            make.bottom.equalTo(connectGoogle.snp.top).offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var signUpButton = CustomPrimaryLargeButton(title: "Sign Up", currentVC: self, destinationVC: FillYourProfileVC())
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.bottom.equalTo(continueLabel.snp.top).offset(-32)
        }
        
    }


}

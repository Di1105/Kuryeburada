//
//  LogInAccountVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 12.01.2023.
//

import UIKit
import SnapKit

class LogInAccountVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI(){
        
        
        lazy var headerView = CustomHeaderView(leftButtonImage: "left", middleHeaderText: "", currentVC: self, destinationVC: CreateAccountVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        lazy var logInLabel = CustomIntroLabel(text: "Login to your Account", color: .DarkBlue)
        view.addSubview(logInLabel)
        logInLabel.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
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
        
        lazy var remmeberButton = CustomRememberButton()
        view.addSubview(remmeberButton)
        remmeberButton.snp.makeConstraints { make in
            make.top.equalTo(passwordText.snp.bottom).offset(16)
            make.centerX.equalToSuperview().offset(16)
        }
                
//Bottom Tools--------------------------------
        
        lazy var signUpSubButton = CustomBottomSignButton(labelText: "Already have an account?", buttonText: "Sign Up", currentVC: self, destinationVC: CreateAccountVC())
        view.addSubview(signUpSubButton)
        signUpSubButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-24)
            make.centerX.equalToSuperview()
        }
        
        lazy var connectGoogle = CustomConnectionSmallButton(connectionLogo: .Google, currentVC: self, destinationVC: LogInAccountVC())
        view.addSubview(connectGoogle)
        connectGoogle.snp.makeConstraints { make in
            make.bottom.equalTo(signUpSubButton.snp.top).offset(-16)
            make.centerX.equalToSuperview()
        }
        
        lazy var connectApple = CustomConnectionSmallButton(connectionLogo: .Google, currentVC: self, destinationVC: LogInAccountVC())
        view.addSubview(connectApple)
        connectApple.snp.makeConstraints { make in
            make.leading.equalTo(connectGoogle.snp.trailing).offset(16)
            make.centerY.equalTo(connectGoogle)
        }
     
        
        lazy var connectFacebook = CustomConnectionSmallButton(connectionLogo: .Facebook, currentVC: self, destinationVC: LogInAccountVC())
        view.addSubview(connectFacebook)
        connectFacebook.snp.makeConstraints { make in
            make.trailing.equalTo(connectGoogle.snp.leading).offset(-16)
            make.centerY.equalTo(connectGoogle)
        }
        
        lazy var continueLabel = UILabel()
        view.addSubview(continueLabel)
        continueLabel.text = "or continue with"
        continueLabel.font = Font.labelFont()
        continueLabel.textColor = .primaryDarkBlue
        continueLabel.snp.makeConstraints { make in
            make.bottom.equalTo(connectGoogle.snp.top).offset(-24)
            make.centerX.equalToSuperview()
        }
        
        lazy var forgetPasswordButton = UIButton()
        view.addSubview(forgetPasswordButton)
        forgetPasswordButton.setTitle("Forgot the password?", for: .normal)
        forgetPasswordButton.setTitleColor(.primaryGreen, for: .normal)
        forgetPasswordButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(continueLabel.snp.top).offset(-24)
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
        forgetPasswordButton.addTarget(self, action: #selector(forgetButtonTapped), for: .touchUpInside)
        
        lazy var signInButton = CustomPrimaryLargeButton(title: "Sign In")
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.bottom.equalTo(forgetPasswordButton.snp.top).offset(-24)
        }
        signInButton.addTarget(self, action: #selector(gotoCongrats), for: .touchUpInside)
        
    }
    
    @objc func forgetButtonTapped(){
        Presentation.presentVC(currentVC: self, destinationVC: ForgotPasswordVC(), toDirection: .right)
    }
    
    @objc func gotoCongrats(){
        Presentation.presentAsPageSheet(currentVC: self, destinationVC: CongratsPopVC())
    }
    
}


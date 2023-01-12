//
//  LogInAccountVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 12.01.2023.
//

import UIKit

class LogInAccountVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()

    }
    
    func setupUI(){
        lazy var headerView = CustomHeaderView(text: "", currentVC: self, destinationVC: OpeningVC())
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
        
        lazy var remmeberLabel = UILabel()
        view.addSubview(remmeberLabel)
        remmeberLabel.backgroundColor = .white
        remmeberLabel.text = "Remember me"
        remmeberLabel.font = Font.labelFont()
        remmeberLabel.textColor = .primaryDarkBlue
        remmeberLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordText.snp.bottom).offset(20)
            make.centerX.equalToSuperview().offset(16)
            make.height.equalTo(20)
        }
        
        lazy var rememberButton = UIButton()
        view.addSubview(rememberButton)
        rememberButton.layer.cornerRadius = 5
        rememberButton.backgroundColor = .white
        rememberButton.layer.borderWidth = 2
        rememberButton.layer.borderColor = UIColor.primaryGreen?.cgColor
        rememberButton.snp.makeConstraints { make in
            make.centerY.equalTo(remmeberLabel)
            make.width.height.equalTo(20)
            make.trailing.equalTo(remmeberLabel.snp.leading).offset(-8)
        }
        rememberButton.addTarget(self, action: #selector(clickButtonDidSelected), for: .touchUpInside)
        
//Bottom Tools--------------------------------
        
        lazy var signUpSubButton = CustomBottomSignButton(buttonText: "Sign Up", labelText: "Already have an account?", currentVC: self, destinationVC: OpeningVC())
        view.addSubview(signUpSubButton)
        signUpSubButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-24)
            make.centerX.equalToSuperview()
        }
        
        lazy var connectGoogle = UIButton()
        view.addSubview(connectGoogle)
        connectGoogle.setImage(UIImage(named: "Google"), for: .normal)
        connectGoogle.layer.cornerRadius = 20
        connectGoogle.layer.borderWidth = 1
        connectGoogle.layer.borderColor = UIColor.primaryGray?.cgColor
        connectGoogle.snp.makeConstraints { make in
            make.bottom.equalTo(signUpSubButton.snp.top).offset(-24)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(56)
        }
        connectGoogle.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        lazy var connectApple = UIButton()
        view.addSubview(connectApple)
        connectApple.setImage(UIImage(named: "Google"), for: .normal)
        connectApple.layer.cornerRadius = 20
        connectApple.layer.borderWidth = 1
        connectApple.layer.borderColor = UIColor.primaryGray?.cgColor
        connectApple.snp.makeConstraints { make in
            make.leading.equalTo(connectGoogle.snp.trailing).offset(16)
            make.centerY.equalTo(connectGoogle)
            make.width.equalTo(80)
            make.height.equalTo(56)
        }
        connectGoogle.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        lazy var connectFacebook = UIButton()
        view.addSubview(connectFacebook)
        connectFacebook.setImage(UIImage(named: "Facebook"), for: .normal)
        connectFacebook.layer.cornerRadius = 20
        connectFacebook.layer.borderWidth = 1
        connectFacebook.layer.borderColor = UIColor.primaryGray?.cgColor
        connectFacebook.snp.makeConstraints { make in
            make.trailing.equalTo(connectGoogle.snp.leading).offset(-16)
            make.centerY.equalTo(connectGoogle)
            make.width.equalTo(80)
            make.height.equalTo(56)
        }
        connectFacebook.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
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
        
        lazy var signInButton = CustomPrimaryLargeButton(title: "Sign In", currentVC: self, destinationVC: OpeningVC())
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.bottom.equalTo(forgetPasswordButton.snp.top).offset(-24)
        }
        
        
        
        
    }
    @objc func buttonTapped(){
        Presentation.presentVC(currentVC: self, destinationVC: OpeningVC(), toDirection: .right)
    }
    
    @objc func clickButtonDidSelected(_ sender: UIButton){
        sender.backgroundColor = sender.backgroundColor == UIColor.white ? .primaryGreen : UIColor.white

    }
    
    @objc func forgetButtonTapped(){
        Presentation.presentVC(currentVC: self, destinationVC: OpeningVC(), toDirection: .right)
    }
    
}


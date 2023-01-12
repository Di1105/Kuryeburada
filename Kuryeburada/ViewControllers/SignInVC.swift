//
//  SignInVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 10.01.2023.
//

import UIKit
import SnapKit

class SignInVC: UIViewController {

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
      
        lazy var logImage = UIImageView()
        view.addSubview(logImage)
        logImage.image = UIImage(named: "logIn")
        
        logImage.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(view.frame.size.height/5)
        }
        
        lazy var logInLabel = CustomIntroLabel(text: "Let's you in", color: .DarkBlue)
        view.addSubview(logInLabel)
        logInLabel.snp.makeConstraints { make in
            make.top.equalTo(logImage.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        lazy var connectFacebook = CustomConnectionButton(connection: "Facebook", currentVC: self, destinationVC: OpeningVC())
        view.addSubview(connectFacebook)
        connectFacebook.snp.makeConstraints { make in
            make.top.equalTo(logInLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var connectGoogle = CustomConnectionButton(connection: "Google", currentVC: self, destinationVC: OpeningVC())
        view.addSubview(connectGoogle)
        connectGoogle.snp.makeConstraints { make in
            make.top.equalTo(connectFacebook.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var connectApple = CustomConnectionButton(connection: "Facebook", currentVC: self, destinationVC: OpeningVC())
        view.addSubview(connectApple)
        connectApple.snp.makeConstraints { make in
            make.top.equalTo(connectGoogle.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var signUpSubButton = CustomBottomSignButton(buttonText: "Don't have an account?", labelText: "Sign Up", currentVC: self, destinationVC: CreateAccountVC())
        view.addSubview(signUpSubButton)
        signUpSubButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-24)
            make.centerX.equalToSuperview()
        }
        
        lazy var signInButton = CustomPrimaryLargeButton(title: "Sign in with password", currentVC: self, destinationVC: OpeningVC())
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.bottom.equalTo(signUpSubButton.snp.top).offset(-16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
    
    }
   
}

//
//  SecurityVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 21.01.2023.
//

import UIKit
import SnapKit

class SecurityVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()

    }
    
    func setupUI(){
        
        lazy var headerView = CustomHeaderView(leftButtonImage: "left", leftOneText: "Security", rightButtonIcon: "", currentVC: self, destinationVC: EditProfileVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.width.equalToSuperview()
        }
        
        lazy var rememberMe = CustomNotificationButton(labelText: "Remember Me")
        view.addSubview(rememberMe)
        rememberMe.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var faceID = CustomNotificationButton(labelText: "Face ID")
        view.addSubview(faceID)
        faceID.snp.makeConstraints { make in
            make.top.equalTo(rememberMe.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var biometricID = CustomNotificationButton(labelText: "Biometric ID")
        view.addSubview(biometricID)
        biometricID.snp.makeConstraints { make in
            make.top.equalTo(faceID.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var googleAuth = CustomBasicButton(labelText: "Google Authenticator", buttonIcon: "right", currentVC: self, destinationVC: SecurityVC())
        view.addSubview(googleAuth)
        googleAuth.snp.makeConstraints { make in
            make.top.equalTo(biometricID.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var changePin = CustomSecondaryLargeButton(title: "Change PIN", currentVC: self, destinationVC: SecurityVC())
        view.addSubview(changePin)
        changePin.snp.makeConstraints { make in
            make.top.equalTo(googleAuth.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var changePassword = CustomSecondaryLargeButton(title: "Change Password", currentVC: self, destinationVC: SecurityVC())
        view.addSubview(changePassword)
        changePassword.snp.makeConstraints { make in
            make.top.equalTo(changePin.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
    }
}

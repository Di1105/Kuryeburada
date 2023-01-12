//
//  FillYourProfileVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 12.01.2023.
//

import UIKit

class FillYourProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()

    }
    
    func setupUI(){
        lazy var headerView = CustomHeaderView(text: "Fill Your Profile", currentVC: self, destinationVC: OpeningVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        lazy var profileImage = UIImageView()
        view.addSubview(profileImage)
        profileImage.image = UIImage(named: "profile")
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(view.frame.size.height/5)
        }
        
        lazy var nameText = CustomTextField(placeholder: "Ful Name")
        view.addSubview(nameText)
        nameText.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var nickNameText = CustomTextField(placeholder: "Nick Name")
        view.addSubview(nickNameText)
        nickNameText.snp.makeConstraints { make in
            make.top.equalTo(nameText.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var birthDayText = CustomTextField(placeholder: "Date of Birth", leftImgName: "email")
        view.addSubview(birthDayText)
        birthDayText.snp.makeConstraints { make in
            make.top.equalTo(nickNameText.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        
        lazy var emailText = CustomTextField(placeholder: "Email", leftImgName: "email")
        view.addSubview(emailText)
        emailText.snp.makeConstraints { make in
            make.top.equalTo(birthDayText.snp.bottom).offset(16)
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
        
       
        
        
//Bottom Tools--------------------------------
        
        
        
        lazy var continueButton = CustomPrimaryLargeButton(title: "Continue", currentVC: self, destinationVC: OpeningVC())
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-32)
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



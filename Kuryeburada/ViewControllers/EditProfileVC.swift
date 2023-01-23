//
//  EditProfileVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 20.01.2023.
//

import UIKit

class EditProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()

    }
    
    func setupUI(){
        lazy var headerView = CustomHeaderView(leftButtonImage: "left", leftOneText: "Edit Profile", rightButtonIcon: "", currentVC: self, destinationVC: CongratsPopVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.width.equalToSuperview()
        }
        
        lazy var updateButton = CustomPrimaryLargeButton(title: "Update", currentVC: self, destinationVC: CongratsPopVC())
        view.addSubview(updateButton)
        updateButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-32)
        }
        
        lazy var scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(updateButton.snp.top).offset(-8)
        }
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        scrollView.backgroundColor = .white
        
        lazy var nameText = CustomTextField()
        scrollView.addSubview(nameText)
        nameText.text = "Angela Lina Broschlova"
        nameText.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var nickText = CustomTextField()
        scrollView.addSubview(nickText)
        nickText.text = "Angie"
        nickText.snp.makeConstraints { make in
            make.top.equalTo(nameText.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var birthdayText = CustomTextField(placeholder: "", leftImgName: "date")
        scrollView.addSubview(birthdayText)
        birthdayText.text = "11/05/1990"
        birthdayText.snp.makeConstraints { make in
            make.top.equalTo(nickText.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var emailText = CustomTextField(placeholder: "", leftImgName: "email")
        scrollView.addSubview(emailText)
        emailText.text = "angelabrosh@gmail.com"
        emailText.snp.makeConstraints { make in
            make.top.equalTo(birthdayText.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var countryText = CustomTextField(placeholder: "", leftImgName: "left")
        scrollView.addSubview(countryText)
        countryText.text = "United States"
        countryText.snp.makeConstraints { make in
            make.top.equalTo(emailText.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var telText = CustomTextField(placeholder: "", leftImgName: "list")
        scrollView.addSubview(telText)
        telText.text = "+1-235 345 3455"
        telText.snp.makeConstraints { make in
            make.top.equalTo(countryText.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var genderText = CustomTextField(placeholder: "", leftImgName: "left")
        scrollView.addSubview(genderText)
        genderText.text = "Female"
        genderText.snp.makeConstraints { make in
            make.top.equalTo(telText.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var adressText = CustomTextField()
        scrollView.addSubview(adressText)
        adressText.text = "324 New Avenue, New York, United States"
        adressText.snp.makeConstraints { make in
            make.top.equalTo(genderText.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
    }

}

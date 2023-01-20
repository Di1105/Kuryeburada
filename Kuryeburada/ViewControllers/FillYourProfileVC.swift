//
//  FillYourProfileVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 12.01.2023.
//

import UIKit

class FillYourProfileVC: UIViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    lazy var profileImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()

    }
    
    func setupUI(){
        
        lazy var headerView = CustomHeaderView(leftButtonImage: "left", leftOneText: "Fill Your Profile", rightButtonIcon: "", currentVC: self, destinationVC: CreateAccountVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        view.addSubview(profileImage)
        profileImage.image = UIImage(named: "profile")
        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = 50
        profileImage.clipsToBounds = true
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
        profileImage.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectPhoto))
        profileImage.addGestureRecognizer(gesture)
        
        lazy var pencilImage = UIImageView()
        view.addSubview(pencilImage)
        pencilImage.image = UIImage(named: "pencil")
        pencilImage.layer.cornerRadius = 5
        pencilImage.clipsToBounds = true
        pencilImage.snp.makeConstraints { make in
            make.trailing.equalTo(profileImage)
            make.bottom.equalTo(profileImage)
            make.height.width.equalTo(30)

        }
        

        
        lazy var continueButton = CustomPrimaryLargeButton(title: "Continue", currentVC: self, destinationVC: PinMapVC())
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-32)
        }
        
        lazy var scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(continueButton.snp.top).offset(-16)
        }
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height*0.8)
        scrollView.backgroundColor = .white
        
        lazy var nameText = CustomTextField(placeholder: "Ful Name")
        scrollView.addSubview(nameText)
        nameText.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var nickNameText = CustomTextField(placeholder: "Nick Name")
        scrollView.addSubview(nickNameText)
        nickNameText.snp.makeConstraints { make in
            make.top.equalTo(nameText.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var birthDayText = CustomTextField(placeholder: "Date of Birth", leftImgName: "email")
        scrollView.addSubview(birthDayText)
        birthDayText.snp.makeConstraints { make in
            make.top.equalTo(nickNameText.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        
        lazy var emailText = CustomTextField(placeholder: "Email", leftImgName: "email")
        scrollView.addSubview(emailText)
        emailText.snp.makeConstraints { make in
            make.top.equalTo(birthDayText.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        
        lazy var passwordText = CustomTextField(placeholder: "Password", leftImgName: "password", isSecureText: true)
        scrollView.addSubview(passwordText)
        passwordText.snp.makeConstraints { make in
            make.top.equalTo(emailText.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var phoneText = CustomTextField(placeholder: "Phone Number", leftImgName: "email")
        scrollView.addSubview(phoneText)
        phoneText.snp.makeConstraints { make in
            make.top.equalTo(passwordText.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var genderText = CustomTextField(placeholder: "Gender", leftImgName: "email")
        scrollView.addSubview(genderText)
        genderText.snp.makeConstraints { make in
            make.top.equalTo(phoneText.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagePick = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        profileImage.image = imagePick
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func selectPhoto(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
}



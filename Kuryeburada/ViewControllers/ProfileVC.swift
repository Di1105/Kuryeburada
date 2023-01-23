//
//  ProfileVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 13.01.2023.
//

import UIKit
import SnapKit

class ProfileVC: UIViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    lazy var profileImage = UIImageView()
    lazy var profileName = UILabel()
    lazy var emailLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI(){
       lazy var headerView = CustomHeaderView(leftButtonImage: "logo", leftOneText: "Profile", rightButtonIcon: "person", currentVC: self, destinationVC: ProfileVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
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
        
        view.addSubview(profileName)
        profileName.font = Font.header2()
        profileName.text = "Angela Lina Broschlova"
        profileName.textColor = .primaryDarkBlue
        profileName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileImage.snp.bottom).offset(16)
        }
        
        view.addSubview(emailLabel)
        emailLabel.font = Font.textField()
        emailLabel.text = "angelabrosh@gmail.com"
        emailLabel.textColor = .primaryGray
        emailLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileName.snp.bottom).offset(8)
        }
        
        lazy var scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height*0.8)
        scrollView.backgroundColor = .white
        
        lazy var editProfile = CustomProfileVCButton(leftButtonImage: "person", buttonLabel1: "Edit Profile", buttonLabel2: "", rightButtonImg: "right")
        scrollView.addSubview(editProfile)
        editProfile.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
      
        
        lazy var notification = CustomProfileVCButton(leftButtonImage: "location", buttonLabel1: "Notification", buttonLabel2: "", rightButtonImg: "right")
        scrollView.addSubview(notification)
        notification.snp.makeConstraints { make in
            make.top.equalTo(editProfile.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
         
        lazy var payment = CustomProfileVCButton(leftButtonImage: "email", buttonLabel1: "Payment", buttonLabel2: "", rightButtonImg: "right")
        scrollView.addSubview(payment)
        payment.snp.makeConstraints { make in
            make.top.equalTo(notification.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var security = CustomProfileVCButton(leftButtonImage: "password", buttonLabel1: "Payment", buttonLabel2: "", rightButtonImg: "right")
        scrollView.addSubview(security)
        security.snp.makeConstraints { make in
            make.top.equalTo(payment.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var language = CustomProfileVCButton(leftButtonImage: "person", buttonLabel1: "Language", buttonLabel2: "English(US)", rightButtonImg: "right")
        scrollView.addSubview(language)
        language.snp.makeConstraints { make in
            make.top.equalTo(security.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var darkMode = CustomProfileVCButton(leftButtonImage: "date", buttonLabel1: "Dark Mode", buttonLabel2: "", rightButtonImg: "")
        scrollView.addSubview(darkMode)
        darkMode.snp.makeConstraints { make in
            make.top.equalTo(language.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var privacy = CustomProfileVCButton(leftButtonImage: "password", buttonLabel1: "Privacy Policy", buttonLabel2: "", rightButtonImg: "right")
        scrollView.addSubview(privacy)
        privacy.snp.makeConstraints { make in
            make.top.equalTo(darkMode.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var invite = CustomProfileVCButton(leftButtonImage: "location", buttonLabel1: "Invite Friends", buttonLabel2: "", rightButtonImg: "right")
        scrollView.addSubview(invite)
        invite.snp.makeConstraints { make in
            make.top.equalTo(privacy.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var logOut = CustomProfileVCButton(leftButtonImage: "list", buttonLabel1: "Log Out", buttonLabel2: "", rightButtonImg: "")
        logOut.leftButtonImg.tintColor = .red
        logOut.buttonLabel1.textColor = .red
        scrollView.addSubview(logOut)
        logOut.snp.makeConstraints { make in
            make.top.equalTo(invite.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
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

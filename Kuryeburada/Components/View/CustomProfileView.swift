//
//  CustomProfileView.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 19.01.2023.
//

import UIKit
import SnapKit

class CustomProfileView: UIView,UIImagePickerControllerDelegate & UINavigationControllerDelegate  {

    lazy var profileButton = UIButton()
    lazy var pencilImage = UIImageView()
    lazy var profileImage = UIImageView()
    lazy var profileName = UILabel()
    lazy var emailLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(Image: String, nameText: String, emailText: String){
        super.init(frame: .zero)
        configureUI()
        self.profileImage.image = UIImage(named: Image)
        self.profileName.text = nameText
        self.emailLabel.text = emailText
    }
    
    private func configureUI(){
        
        addSubview(profileButton)
        profileButton.layer.masksToBounds = false
        profileButton.layer.cornerRadius = 50
        profileButton.clipsToBounds = true
        profileButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
        
        addSubview(pencilImage)
        pencilImage.image = UIImage(named: "pencil")
        pencilImage.layer.cornerRadius = 5
        pencilImage.clipsToBounds = true
        pencilImage.snp.makeConstraints { make in
            make.trailing.equalTo(profileButton)
            make.bottom.equalTo(profileButton)
            make.height.width.equalTo(30)

        }
        
        profileButton.addSubview(profileImage)
        profileImage.image = UIImage(named: "profile")
        profileImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
        profileImage.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectPhoto))
        profileImage.addGestureRecognizer(gesture)
        
        addSubview(profileName)
        profileName.font = Font.header2()
        profileName.textColor = .primaryDarkBlue
        profileName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileImage.snp.bottom).offset(16)
        }
        
        addSubview(emailLabel)
        emailLabel.font = Font.textField()
        emailLabel.textColor = .primaryGray
        emailLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileName.snp.bottom).offset(8)
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
      //  present(picker, animated: true)
    }
    

}

//
//  ProfileVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 13.01.2023.
//

import UIKit
import SnapKit

class ProfileVC: UIViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    lazy var profileView = CustomProfileView()

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
        
        profileView = CustomProfileView(Image: "profile", nameText: "Angela Smasher", emailText: "angelas_smasher@gmail.com")
        view.addSubview(profileView)
        profileView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectPhoto))
        profileView.addGestureRecognizer(gesture)
        
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
            make.top.equalTo(profileView.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(continueButton.snp.top).offset(-16)
        }
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height*0.8)
        scrollView.backgroundColor = .white
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagePick = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        profileView.profileImage.image = imagePick
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

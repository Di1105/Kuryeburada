//
//  CreatePinVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 12.01.2023.
//

import UIKit
import CHIOTPField

class CreateNewPinVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI(){
        
        lazy var headerView = CustomHeaderView(leftButtonImage: "left", leftOneText: "Create New PIN", rightButtonIcon: "", currentVC: self, destinationVC: PinMapVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        
        lazy var continueButton = CustomPrimaryLargeButton(title: "Continue", currentVC: self, destinationVC: SetFingerPrintVC())
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-32)
        }
        
        lazy var field = CHIOTPFieldOne(frame: .init(x: 90, y: 320, width: 220, height: 50))
        field.numberOfDigits = 4
        field.cornerRadius = 25
        view.addSubview(field)
        
        
        lazy var infoLabel = UILabel()
        view.addSubview(infoLabel)
        infoLabel.text = "Add a PIN number to make your account \n more secure"
        infoLabel.font = Font.labelFont()
        infoLabel.textColor = .primaryDarkBlue
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.textAlignment = .center
        infoLabel.numberOfLines = 2
        infoLabel.snp.makeConstraints { make in
            make.bottom.equalTo(field.snp.top).offset(-48)
            make.centerX.equalToSuperview()
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}


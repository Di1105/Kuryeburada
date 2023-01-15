//
//  CreateNewPasswordVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 12.01.2023.
//

import UIKit
import CHIOTPField

class SendPinVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupUI()
        
    }
    
    func setupUI(){
        
        lazy var headerView = CustomHeaderView(leftButtonImage: "left", leftOneText: "Forgot Password", rightButtonIcon: "", currentVC: self, destinationVC: ForgotPasswordVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        lazy var verifyButton = CustomPrimaryLargeButton(title: "Verify", currentVC: self, destinationVC: CreateNewPasswordVC())
        view.addSubview(verifyButton)
        verifyButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-32)
        }
        
        lazy var field = CHIOTPFieldOne(frame: .init(x: (view.frame.size.width-220)/2, y: 320, width: 220, height: 50))
        field.numberOfDigits = 4
        field.cornerRadius = 25
        view.addSubview(field)
        
        lazy var resendCodeButton = UIButton()
        view.addSubview(resendCodeButton)
        resendCodeButton.setTitle("Resend code in 55 s", for: .normal)
        resendCodeButton.setTitleColor(.primaryGreen, for: .normal)
        resendCodeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(field.snp.bottom).offset(40)
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
        resendCodeButton.addTarget(self, action: #selector(resendCodeTapped), for: .touchUpInside)
        
        lazy var infoLabel = UILabel()
        view.addSubview(infoLabel)
        infoLabel.text = "Code has been send to +1 11****99" //mail ya da telefona göre
        infoLabel.font = Font.labelFont()
        infoLabel.textColor = .primaryDarkBlue
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.numberOfLines = 2
        infoLabel.textAlignment = .center
        infoLabel.snp.makeConstraints { make in
            make.bottom.equalTo(field.snp.top).offset(-40)
            make.centerX.equalToSuperview()
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func resendCodeTapped(){
 
        
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }

}

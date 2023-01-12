//
//  SetFingerPrintVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 12.01.2023.
//

import UIKit

class SetFingerPrintVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupUI()

    }
    
    func setupUI(){
        
        lazy var headerView = CustomHeaderView(text: "Set Your Fingerprint", currentVC: self, destinationVC: CreatePinVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        

        
        lazy var continueButton = CustomPrimarySmallButton(title: "Continue")
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-32)
           }
        continueButton.addTarget(self, action: #selector(goto), for: .touchUpInside)
        
        lazy var skipButton = CustomSecondarySmallButton(title: "Skip", currentVC: self, destinationVC: SetFingerPrintVC())
        view.addSubview(skipButton)
        skipButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.bottom.equalToSuperview().offset(-32)
        }
        
        lazy var middleView = UIView()
        view.addSubview(middleView)
        middleView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalTo(continueButton.snp.top)
        }
        
        lazy var fingerImage = UIImageView()
        middleView.addSubview(fingerImage)
        fingerImage.image = UIImage(named: "finger")
        fingerImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
        lazy var infoLabel = UILabel()
        middleView.addSubview(infoLabel)
        infoLabel.text = "Add a fingerprint to make your account \n more secure"
        infoLabel.font = Font.labelFont()
        infoLabel.textColor = .primaryDarkBlue
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.numberOfLines = 2
        infoLabel.snp.makeConstraints { make in
            make.bottom.equalTo(fingerImage.snp.top).offset(-16)
            make.centerX.equalToSuperview()
        }
        infoLabel.textAlignment = .center
        
        lazy var infoLabelSub = UILabel()
        middleView.addSubview(infoLabelSub)
        infoLabelSub.text = "Please put your finger on the fingerprint \n scanner to get start"
        infoLabelSub.font = Font.labelFont()
        infoLabelSub.textColor = .primaryDarkBlue
        infoLabelSub.lineBreakMode = .byWordWrapping
        infoLabelSub.numberOfLines = 2
        infoLabelSub.snp.makeConstraints { make in
            make.top.equalTo(fingerImage.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        infoLabelSub.textAlignment = .center
        
        
        
    }
    
    @objc func goto(){
        Presentation.presentAsPageSheet(currentVC: self, destinationVC: CongratsPopVC())
    }
}

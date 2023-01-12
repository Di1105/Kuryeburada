//
//  SecondViewController.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 9.01.2023.
//

import UIKit
import SnapKit

class WelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupUI()
    }
    
    
    func setupUI(){
        
        lazy var backroundImageView = UIImageView()
        view.addSubview(backroundImageView)
        backroundImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalToSuperview()
        }
        backroundImageView.image = UIImage(named: "kargo")
        backroundImageView.contentMode = .scaleToFill
        
        
        lazy var welcomeLabel = UILabel()
        view.addSubview(welcomeLabel)
        welcomeLabel.text = "Welcome to"
        welcomeLabel.font = Font.custom(size: 32, fontWeight: .bold)
        welcomeLabel.textColor = .primaryYellow
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY).offset(-50)
            make.leading.equalToSuperview().offset(32)
        }
        
        lazy var branLabel = UILabel()
        view.addSubview(branLabel)
        branLabel.text = "Kurye Burada"
        branLabel.font = Font.custom(size: 40, fontWeight: .bold)
        branLabel.textColor = .primaryGreen
        branLabel.snp.makeConstraints { make in
            make.leading.equalTo(welcomeLabel)
            make.trailing.equalToSuperview().offset(-32)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(24)
        }
        
        lazy var introLabel = UILabel()
        view.addSubview(introLabel)
        introLabel.text = "The best app for shipping and delivery in this century"
        introLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        introLabel.textColor = .white
        introLabel.lineBreakMode = .byWordWrapping
        introLabel.numberOfLines = 2
        introLabel.snp.makeConstraints { make in
            make.leading.equalTo(branLabel)
            make.trailing.equalToSuperview().offset(-32)
            make.top.equalTo(branLabel.snp.bottom).offset(24)
        }
        
        
        

        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(goToFirstPage), userInfo: nil, repeats: false)
    }
    @objc func goToFirstPage(){
        Presentation.presentVC(currentVC: self, destinationVC: Intro1VC(), toDirection: .right)
    }
}

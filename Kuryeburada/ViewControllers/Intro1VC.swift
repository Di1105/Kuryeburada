//
//  Intro1VC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 10.01.2023.
//

import UIKit
import SnapKit

class Intro1VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI(){
        
        lazy var introImageView = UIImageView()
        introImageView.image = UIImage(named: "intro1")
        view.addSubview(introImageView)
        introImageView.snp.makeConstraints { make in
            make.top.width.equalToSuperview()
            make.height.equalTo(view.frame.size.height/2+50)
        }
        
        lazy var introTextView = CustomIntroTextView(frame: .zero, text: "The best app for shipping & delivery in this century")
        view.addSubview(introTextView)
        introTextView.snp.makeConstraints { make in
            make.top.equalTo(introImageView.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        
        lazy var introButton = CustomPrimaryLargeButton(title: "Next", currentVC: self, destinationVC: Intro2VC())
        view.addSubview(introButton)
        introButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-32)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
    }
}

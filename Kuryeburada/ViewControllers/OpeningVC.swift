//
//  ViewController.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 9.01.2023.
//

import UIKit
import SnapKit
import Lottie

class OpeningVC: UIViewController {

    private var animationView: LottieAnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryGreen
        setupUI()
        
        
      }
    
    
    func setupUI(){
        
        lazy var logoLabel = UILabel()
        view.addSubview(logoLabel)
        logoLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(160)
            make.width.equalTo(240)
        }
        logoLabel.backgroundColor = .white
        logoLabel.layer.borderColor = UIColor.primaryGray?.cgColor
        logoLabel.layer.borderWidth = 1
        
        animationView = .init(name: "wait")
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play()
        animationView?.snp.makeConstraints({ make in
            make.top.equalTo(logoLabel.snp.bottom).offset(100)
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
        })
        
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(goToFirstPage), userInfo: nil, repeats: false)
    }
    
    @objc func goToFirstPage(){
        Presentation.presentVC(currentVC: self, destinationVC: WelcomeVC(), toDirection: .right)
    }
}


    




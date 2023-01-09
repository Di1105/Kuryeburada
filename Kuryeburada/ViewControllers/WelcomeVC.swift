//
//  SecondViewController.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 9.01.2023.
//

import UIKit

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
        backroundImageView.contentMode = .scaleAspectFit

        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(goToFirstPage), userInfo: nil, repeats: false)
    }
    @objc func goToFirstPage(){
        Presentation.presentVC(currentVC: self, destinationVC: Intro1VC(), toDirection: .right)
    }
}

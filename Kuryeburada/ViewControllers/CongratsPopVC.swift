//
//  PaymentProfileVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 13.01.2023.
//

import UIKit
import Lottie

class CongratsPopVC: UIViewController {
    
    private var animationView: LottieAnimationView?

    let button = UIButton()
    let tabBar = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    func setUpUI(){
        
        lazy var congratsView = UIView()
        view.addSubview(congratsView)
        congratsView.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(view.frame.size.height*2/3)
            make.center.equalToSuperview()
        }
        congratsView.backgroundColor = .white
        congratsView.layer.cornerRadius = 20
        
        lazy var congratsLabel = UILabel()
        congratsView.addSubview(congratsLabel)
        congratsLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(30)
        }
        congratsLabel.text = "Congratulations!"
        congratsLabel.textAlignment = .center
        congratsLabel.font = Font.header1()
        congratsLabel.textColor = .primaryGreen

        
        lazy var congratsImage = UIImageView()
        congratsView.addSubview(congratsImage)
        congratsImage.snp.makeConstraints { make in
            make.bottom.equalTo(congratsLabel.snp.top).offset(-16)
            make.height.width.equalTo(160)
            make.centerX.equalToSuperview()
        }
        congratsImage.image = UIImage(named: "logIn")
        
        lazy var infoLabel = UILabel()
        congratsView.addSubview(infoLabel)
        infoLabel.text = "Your account is ready to use. You will be redirected to the Home page in a few second"
        infoLabel.textAlignment = .center
        infoLabel.font = Font.labelFont()
        infoLabel.textColor = .primaryDarkBlue
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.numberOfLines = 2
        infoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.top.equalTo(congratsLabel.snp.bottom).offset(16)
        }
        
        animationView = .init(name: "wait")
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        congratsView.addSubview(animationView!)
        animationView!.play()
        animationView?.snp.makeConstraints({ make in
            make.top.equalTo(infoLabel.snp.bottom).offset(16)
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
        })
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(goToFirstPage), userInfo: nil, repeats: false)
    }
    
    @objc func goToFirstPage(){
        let vc1 = UINavigationController(rootViewController: HomeVC())
        let vc2 = UINavigationController(rootViewController:MyOrderVC())
        let vc3 = UINavigationController(rootViewController:InboxVC())
        let vc4 = UINavigationController(rootViewController:ProfileVC())
        
        vc1.title = "Home"
        vc2.title = "My Order"
        vc3.title = "Inbox"
        vc4.title = "Profile"
        
        tabBar.setViewControllers([vc1, vc2, vc3, vc4], animated: false  )
        tabBar.tabBar.backgroundColor = .white

        guard let items = tabBar.tabBar.items else {
            return
        }
        let image = ["house","heart","pencil","person"]
        //Title subtitle arka plan renkleri değişecek. subtitle itemların rengi değişecek
        
        for x in 0..<items.count {
            items[x].badgeValue = "1"
            items[x].image?.withTintColor(.red)
            items[x].image = UIImage(systemName : image[x])
            
        }
        
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)
 
    }

}


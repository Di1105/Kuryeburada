//
//  NotificationVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 20.01.2023.
//

import UIKit

class NotificationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()

    }
    
    func setupUI(){
        
        lazy var headerView = CustomHeaderView(leftButtonImage: "left", leftOneText: "Notification", rightButtonIcon: "", currentVC: self, destinationVC: EditProfileVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.width.equalToSuperview()
        }
        
        lazy var scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        scrollView.backgroundColor = .white
        
        lazy var notiLabel1 = CustomNotificationButton(labelText: "General notification")
        scrollView.addSubview(notiLabel1)
        notiLabel1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var notiLabel2 = CustomNotificationButton(labelText: "Sound")
        scrollView.addSubview(notiLabel2)
        notiLabel2.snp.makeConstraints { make in
            make.top.equalTo(notiLabel1.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var notiLabel3 = CustomNotificationButton(labelText: "Vibrate")
        scrollView.addSubview(notiLabel3)
        notiLabel3.snp.makeConstraints { make in
            make.top.equalTo(notiLabel2.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var notiLabel4 = CustomNotificationButton(labelText: "Special Offers")
        scrollView.addSubview(notiLabel4)
        notiLabel4.snp.makeConstraints { make in
            make.top.equalTo(notiLabel3.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var notiLabel5 = CustomNotificationButton(labelText: "Promo & Discount")
        scrollView.addSubview(notiLabel5)
        notiLabel5.snp.makeConstraints { make in
            make.top.equalTo(notiLabel4.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var notiLabel6 = CustomNotificationButton(labelText: "Payments")
        scrollView.addSubview(notiLabel6)
        notiLabel6.snp.makeConstraints { make in
            make.top.equalTo(notiLabel5.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var notiLabel7 = CustomNotificationButton(labelText: "CashBack")
        scrollView.addSubview(notiLabel7)
        notiLabel7.snp.makeConstraints { make in
            make.top.equalTo(notiLabel6.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var notiLabel8 = CustomNotificationButton(labelText: "App Updates")
        scrollView.addSubview(notiLabel8)
        notiLabel8.snp.makeConstraints { make in
            make.top.equalTo(notiLabel7.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var notiLabel9 = CustomNotificationButton(labelText: "New Service Available")
        scrollView.addSubview(notiLabel9)
        notiLabel9.snp.makeConstraints { make in
            make.top.equalTo(notiLabel8.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var notiLabel10 = CustomNotificationButton(labelText: "New Tips Available")
        scrollView.addSubview(notiLabel10)
        notiLabel10.snp.makeConstraints { make in
            make.top.equalTo(notiLabel9.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
    }

}

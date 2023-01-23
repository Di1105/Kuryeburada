//
//  TrackVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 16.01.2023.
//

import UIKit
import SnapKit

class TrackVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()

    }
    func setupUI(){
        lazy var headerView = CustomHeaderView(leftButtonImage: "left" , leftOneText: "Track SK92936790", rightButtonIcon: "person", currentVC: self, destinationVC: MyOrderVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        
        lazy var secondView = CustomTrackCellView(profileImage: "profile", profileName: "Angela Blabla", messageText: "4.8 Rates", secondButtonName: "email" , oneButtonName: "phone", currentVC: self, destinationVC: TrackVC())
        view.addSubview(secondView)
        secondView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(16)
            make.width.equalToSuperview()
        }
        
        lazy var reportButton = CustomSecondaryLargeButton(title: "Report an Issue", currentVC: self, destinationVC: TrackVC())
        view.addSubview(reportButton)
        reportButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-32)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var trackMiddle = CustomTrackView(headImage: "pay", firstText: "2-3 days", secondText: "Estimate")
        view.addSubview(trackMiddle)
        trackMiddle.snp.makeConstraints { make in
            make.top.equalTo(secondView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.frame.size.width/4)
        }
        
        lazy var trackFirst = CustomTrackView(headImage: "wal", firstText: "SK1235346", secondText: "Track Id")
        view.addSubview(trackFirst)
        trackFirst.snp.makeConstraints { make in
            make.top.equalTo(trackMiddle)
            make.trailing.equalTo(trackMiddle.snp.leading).offset(-16)
            make.width.equalTo(view.frame.size.width/4)
        }
        
        lazy var trackLast = CustomTrackView(headImage: "pay2", firstText: "2.4 kg", secondText: "Package Weight")
        view.addSubview(trackLast)
        trackLast.snp.makeConstraints { make in
            make.top.equalTo(trackMiddle)
            make.leading.equalTo(trackMiddle.snp.trailing).offset(16)
            make.width.equalTo(view.frame.size.width/4)
        }
        
        lazy var scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.backgroundColor = .white
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height*0.7)
        scrollView.isPagingEnabled = true
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(trackMiddle.snp.bottom).offset(8)
            make.width.equalToSuperview()
            make.bottom.equalTo(reportButton.snp.top).offset(-8)
        }
        
        lazy var step1View = CustomTrackCellView(iconImage: "location", profileName: "23523 Butternut Pass", messageText: "Waiting", secondButtonName: "", oneButtonName: "", currentVC: self, destinationVC: TrackVC())
        scrollView.addSubview(step1View)
        step1View.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var step2View = CustomTrackCellView(iconImage: "alert", profileName: "52325 Clyde Galler Park DC", messageText: "Waiting", secondButtonName: "", oneButtonName: "", currentVC: self, destinationVC: TrackVC())
        scrollView.addSubview(step2View)
        step2View.snp.makeConstraints { make in
            make.top.equalTo(step1View.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()        }
        
        lazy var step3View = CustomTrackCellView(iconImage: "alert", profileName: "732 Sunny Side DC", messageText: "Waiting", secondButtonName: "", oneButtonName: "", currentVC: self, destinationVC: TrackVC())
        scrollView.addSubview(step3View)
        step3View.snp.makeConstraints { make in
            make.top.equalTo(step2View.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()        }
        
        lazy var step4View = CustomTrackCellView(iconImage: "alert", profileName: "7732 Lakexood Garden DC", messageText: "Waiting",secondButtonName: "", oneButtonName: "", currentVC: self, destinationVC: TrackVC())
        scrollView.addSubview(step4View)
        step4View.snp.makeConstraints { make in
            make.top.equalTo(step3View.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()        }
        
        lazy var step5View = CustomTrackCellView(iconImage: "alert", profileName: "67089 Messrsmith Harden Stret DC", messageText: "Waiting", secondButtonName: "", oneButtonName: "", currentVC: self, destinationVC: TrackVC())
        scrollView.addSubview(step5View)
        step5View.snp.makeConstraints { make in
            make.top.equalTo(step4View.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()        }
        
    }


}

//
//  MyOrderVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 13.01.2023.
//

import UIKit
import SnapKit

class MyOrderVC: UIViewController {

    let itemsSegment = ["For Me","To Me"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupUI()
    }
    
    func setupUI(){
        
        lazy var headerView = CustomHeaderView(leftButtonImage: "logo", leftOneText: "My Order", rightButtonIcon: "person", currentVC: self, destinationVC: MyOrderVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.width.equalToSuperview()
        }
        
        lazy var searchBar = CustomSearchBar(placeholder: "Enter Track ID Number")
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var segmentedController = UISegmentedControl(items: itemsSegment)
        view.addSubview(segmentedController)
        segmentedController.backgroundColor = .secondaryGreen
        segmentedController.tintColor = .white
        segmentedController.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        segmentedController.addTarget(self, action: #selector(changeView), for: .valueChanged)
        
        lazy var tableView = UITableView()
        
        
    }
    @objc func changeView(_ segmentedController : UISegmentedControl){
        
        switch segmentedController.selectedSegmentIndex {
        case 0:
            self.view.backgroundColor = .primaryGreen
        case 1:
            self.view.backgroundColor = .white
        default:
            self.view.backgroundColor = .systemPink
            
        }
    }
}

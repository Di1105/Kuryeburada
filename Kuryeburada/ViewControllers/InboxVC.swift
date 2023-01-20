//
//  InboxVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 13.01.2023.
//

import UIKit
import SnapKit

class InboxVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data = DataStruct()

   
    lazy var tableView = UITableView()
    lazy var segmentedController = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    
    func setupUI(){
        
        lazy var headerView = CustomHeaderView(leftButtonImage: "logo", leftOneText: "Inbox", firstRightIcon: "Search", rightButtonIcon: "person", currentVC: self, destinationVC: InboxVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.width.equalToSuperview()
        }
        
        segmentedController = UISegmentedControl(items: data.itemsSegmentInbox)
        view.addSubview(segmentedController)
        segmentedController.backgroundColor = .secondaryGreen
        segmentedController.tintColor = .white
        segmentedController.selectedSegmentIndex = 0
        segmentedController.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
        }
        segmentedController.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
    
        
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(InboxChatsCell.self, forCellReuseIdentifier: InboxChatsCell.identifier)
        tableView.register(InboxCallsCell.self, forCellReuseIdentifier: InboxCallsCell.identifier)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segmentedController.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
    }
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
            tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellIndex = segmentedController.selectedSegmentIndex == 0 ? data.profilePics.count : data.profilePics2.count
        return cellIndex
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if segmentedController.selectedSegmentIndex == 0{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: InboxChatsCell.identifier) as! InboxChatsCell
            cell1.cellImage.image = data.profilePics[indexPath.row]
            cell1.nameLabel.text = data.InboxNames[indexPath.row]
            cell1.messageLabel.text = data.InboxMsg[indexPath.row]
            cell1.notificLabel.text = data.notifics[indexPath.row]
            cell1.dateLabel.text = data.dates[indexPath.row]
            if cell1.notificLabel.text == ""{
                cell1.notificLabel.backgroundColor = .white
            }else{
                cell1.notificLabel.backgroundColor = .secondaryGreen
            }
            return cell1
        }else if segmentedController.selectedSegmentIndex == 1{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: InboxCallsCell.identifier) as! InboxCallsCell
            cell2.cellImage.image = data.InboxPics[indexPath.row]
            cell2.cellLabel.text = data.Inbox2Names[indexPath.row]
            cell2.cellLabel2.text = data.InboxTel[indexPath.row]
            return cell2
        }
        return cell

    }

}

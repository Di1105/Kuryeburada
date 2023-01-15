//
//  InboxVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 13.01.2023.
//

import UIKit
import SnapKit

class InboxVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    lazy var tableView = UITableView()
    lazy var imageView = UIImageView()
    lazy var labelFriend = UILabel()
    lazy var labelnumber = UILabel()
    lazy var inviteButton = UIButton()
    
    var arrayImages: [UIImage] = []
    var arrayFriend: [String] = ["James Lawson","Laura Octavian","Jhonson Bridge","Griffin Rod"]
    var arrayTel: [String] = ["+1-300-555-0133","+1-302-555-0133","+1-300-554-0143","+1-304-544-0133"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        setupUI()
    }
    
    func setupUI(){
        lazy var headerView = CustomHeaderView(leftButtonImage: "logo", leftOneText: "Inbox", rightButtonIcon: "person", currentVC: self, destinationVC: InboxVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.width.equalToSuperview()
        }
        
        lazy var chatsButton = CustomSecondaryLargeButton(title: "Chats")
        view.addSubview(chatsButton)
        chatsButton.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(view.frame.size.width/2-24)
        }
        
        lazy var callsButton = CustomSecondaryLargeButton(title: "Calls")
        view.addSubview(callsButton)
        callsButton.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(8)
            make.trailing.equalToSuperview().offset(-16)
            make.width.equalTo(view.frame.size.width/2-24)
        }
  
        lazy var tableView = UITableView()
        view.addSubview(tableView)
        tableView.backgroundColor = .yellow
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.top.equalTo(callsButton.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .orange
        return cell
    }

}

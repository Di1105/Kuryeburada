//
//  InboxFirstCell.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 16.01.2023.
//

import UIKit

class InboxChatsCell: UITableViewCell {
   
    static let identifier = "ChatsCell"
    var nameLabel = UILabel()
    var messageLabel = UILabel()
    var cellImage = UIImageView()
    var notificLabel = UILabel()
    var dateLabel = UILabel()

    let data = DataStruct()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        contentView.addSubview(cellImage)
        cellImage.layer.cornerRadius = 30
        cellImage.layer.masksToBounds = false
        cellImage.clipsToBounds = true
        cellImage.image = UIImage(named: "profile")
        cellImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.leading.equalTo(contentView).offset(20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
            make.width.height.equalTo(60)
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(30)
            make.leading.equalTo(cellImage.snp.trailing).offset(10)
        }
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textColor = .black
        nameLabel.layer.cornerRadius = 20
        nameLabel.text = "........"
        
        contentView.addSubview(messageLabel)
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
            make.leading.equalTo(cellImage.snp.trailing).offset(12)
        }
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.textColor = .gray
        messageLabel.layer.cornerRadius = 20
        messageLabel.text = "..............."
        
        contentView.addSubview(notificLabel)
        notificLabel.backgroundColor = .secondaryGreen
        notificLabel.textAlignment = .center
        notificLabel.textColor = .white
        notificLabel.layer.cornerRadius = 10
        notificLabel.layer.masksToBounds = false
        notificLabel.clipsToBounds = true
        notificLabel.snp.makeConstraints { make in
            make.height.width.equalTo(20)
            make.centerY.equalTo(nameLabel)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
        }
        
        contentView.addSubview(dateLabel)
        dateLabel.textColor = .primaryGray
        dateLabel.font = Font.labelFont()
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(messageLabel)
            make.trailing.equalTo(notificLabel)
        }
        

    }
  
}

//
//  InboxCallsCell.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 17.01.2023.
//

import UIKit

class InboxCallsCell: UITableViewCell {
    
    static let identifier = "CallsCell"
    var cellLabel = UILabel()
    var cellLabel2 = UILabel()
    var cellImage = UIImageView()
    var cellButton = UIButton()
    var cellIcon = UIImageView()
    
    
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
        cellImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.leading.equalTo(contentView).offset(20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
            make.width.height.equalTo(60)
        }
        cellImage.layer.cornerRadius = 30
        cellImage.backgroundColor = .blue
        
        contentView.addSubview(cellLabel)
        cellLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(30)
            make.leading.equalTo(cellImage.snp.trailing).offset(16)
        }
        cellLabel.font = .systemFont(ofSize: 20)
        cellLabel.textColor = .black
        cellLabel.layer.cornerRadius = 20
        cellLabel.text = "Tyniha Obey"
        
        contentView.addSubview(cellIcon)
        cellIcon.snp.makeConstraints { make in
            make.top.equalTo(cellLabel.snp.bottom).offset(8)
            make.leading.equalTo(cellLabel)
            make.height.width.equalTo(10)
        }
        cellIcon.image = UIImage(named: "tik2")
        
        contentView.addSubview(cellLabel2)
        cellLabel2.snp.makeConstraints { make in
            make.centerY.equalTo(cellIcon)
            make.leading.equalTo(cellIcon.snp.trailing).offset(8)
        }
        cellLabel2.font = UIFont.systemFont(ofSize: 14)
        cellLabel2.textColor = .gray
        cellLabel2.layer.cornerRadius = 20
        cellLabel2.text = "+1-200-3838*95"
        
        contentView.addSubview(cellButton)
        cellButton.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(80)
            make.centerY.equalTo(cellImage)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
        }
        cellButton.setImage(UIImage(named: "phone"), for: .normal)
        cellButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    }
    @objc func buttonTapped(){
        
    }
}

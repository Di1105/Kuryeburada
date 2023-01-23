//
//  HomeVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 13.01.2023.
//

import UIKit
import SnapKit

class HomeVC: UIViewController,UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    lazy var collectionView = UICollectionView()
    lazy var data = DataStruct()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI(){
        
        lazy var headerView = CustomHeaderView(leftButtonImage: "profile", leftHeadText: "Angela Lina Lewinstone", sayHiText: "Good Morning", rightButtonIcon: "person", currentVC: self, destinationVC: MyOrderVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.width.equalToSuperview()
        }

        lazy var bankAccountButton = CustomBankButton()
        view.addSubview(bankAccountButton)
        bankAccountButton.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        
        lazy var seacrhBar = CustomSearchBar(placeholder: "Enter Track ID Number")
        view.addSubview(seacrhBar)
        seacrhBar.snp.makeConstraints { make in
            make.top.equalTo(bankAccountButton.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.headerReferenceSize = CGSize(width: view.frame.size.width-32, height: 320)
        layout.itemSize = CGSize(width: (view.frame.size.width-32), height: (view.frame.size.width/4))
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeCollectionVCell.self, forCellWithReuseIdentifier: HomeCollectionVCell.identifier)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(seacrhBar.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        lazy var makeOrderButton = CustomHomeVCButton(buttonImage: "pencil", buttonLabel: "Make Order")
        collectionView.addSubview(makeOrderButton)
        makeOrderButton.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.top)
            make.leading.equalToSuperview()
            make.width.equalTo(view.frame.size.width/2-24)
        }
        
        lazy var checkRatesButton = CustomHomeVCButton(buttonImage: "pay", buttonLabel: "Chack Rates")
        collectionView.addSubview(checkRatesButton)
        checkRatesButton.snp.makeConstraints { make in
            make.top.equalTo(makeOrderButton)
            make.leading.equalTo(makeOrderButton.snp.trailing).offset(16)
            make.width.equalTo(makeOrderButton)
        }
        
        lazy var nearbyDropButton = CustomHomeVCButton(buttonImage: "wal", buttonLabel: "Nearby Drop")
        collectionView.addSubview(nearbyDropButton)
        nearbyDropButton.snp.makeConstraints { make in
            make.top.equalTo(makeOrderButton.snp.bottom).offset(16)
            make.leading.equalTo(makeOrderButton)
            make.height.equalTo(makeOrderButton)
            make.width.equalTo(makeOrderButton)
        }
        
        lazy var helpCenterButton = CustomHomeVCButton(buttonImage: "pay2", buttonLabel: "Help Center")
        collectionView.addSubview(helpCenterButton)
        helpCenterButton.snp.makeConstraints { make in
            make.top.equalTo(nearbyDropButton)
            make.trailing.equalTo(checkRatesButton)
            make.width.equalTo(makeOrderButton)
        }
       
        
        lazy var transHistoryLabel = UILabel()
        transHistoryLabel.text = "Transaction History"
        transHistoryLabel.font = Font.header2()
        transHistoryLabel.textColor = .primaryDarkBlue
        collectionView.addSubview(transHistoryLabel)
        transHistoryLabel.snp.makeConstraints { make in
            make.top.equalTo(nearbyDropButton.snp.bottom).offset(16)
            make.leading.equalTo(makeOrderButton)
            make.height.equalTo(20)
        }
        
        lazy var seeAllButton = UIButton()
        seeAllButton.setTitle("See All", for: .normal)
        seeAllButton.setTitleColor(.secondaryGreen, for: .normal)
        collectionView.addSubview(seeAllButton)
        seeAllButton.snp.makeConstraints { make in
            make.top.equalTo(nearbyDropButton.snp.bottom).offset(16)
            make.trailing.equalTo(checkRatesButton)
            make.height.equalTo(20)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.headerTextArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionVCell.identifier, for: indexPath) as! HomeCollectionVCell
        cell.cellImageView.image = data.imageArray[indexPath.row]
        cell.cellHeadLabel.text = data.headerTextArray[indexPath.row]
        cell.cellInfoLabel.text = data.infoTextArray[indexPath.row]
        cell.timeLabel.text = "2 hours ago"
       
        return cell
    }
    

    

}

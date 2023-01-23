//
//  MyOrderVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 13.01.2023.
//

import UIKit
import SnapKit

class MyOrderVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    lazy var segmentedController = UISegmentedControl(items: data.itemsSegment)
    lazy var collectionViewTop = UICollectionView()
    lazy var collectionViewBack = UICollectionView()
    var data = DataStruct()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI(){
        
        lazy var headerView = CustomHeaderView(leftButtonImage: "logo", leftOneText: "My Order", rightButtonIcon: "person", currentVC: self, destinationVC: MyOrderVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.width.equalToSuperview()
        }
        
        lazy var searchBar = CustomSearchBar(placeholder: "Enter Track ID Number", leftIcon: "list")
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(segmentedController)
        segmentedController.backgroundColor = .secondaryGreen
        segmentedController.tintColor = .white
        segmentedController.selectedSegmentIndex = 0
        segmentedController.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        segmentedController.addTarget(self, action: #selector(changeView), for: .valueChanged)
        
        let layoutTop = UICollectionViewFlowLayout()
        layoutTop.scrollDirection = .horizontal
        layoutTop.minimumLineSpacing = 8
        layoutTop.itemSize = CGSize(width: (view.frame.size.width/4), height: 32)
        collectionViewTop = UICollectionView(frame: .zero, collectionViewLayout: layoutTop)
        view.addSubview(collectionViewTop)
        collectionViewTop.delegate = self
        collectionViewTop.dataSource = self
        collectionViewTop.register(MyOrderTopCell.self, forCellWithReuseIdentifier: MyOrderTopCell.identifier)
        collectionViewTop.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
            make.top.equalTo(segmentedController.snp.bottom).offset(16)
            make.height.equalTo(32)
        }
        
        let layoutBack = UICollectionViewFlowLayout()
        layoutBack.scrollDirection = .vertical
        layoutBack.minimumLineSpacing = 16
        layoutBack.headerReferenceSize = CGSize(width: view.frame.size.width, height: 160)
        layoutBack.itemSize = CGSize(width: ((view.frame.size.width)-32), height: 80)
        collectionViewBack = UICollectionView(frame: .zero, collectionViewLayout: layoutBack)
        view.addSubview(collectionViewBack)
        collectionViewBack.delegate = self
        collectionViewBack.dataSource = self
        collectionViewBack.backgroundColor = .white
        collectionViewBack.register(MyOrderFromMeCell.self, forCellWithReuseIdentifier: MyOrderFromMeCell.identifier)
        collectionViewBack.register(MyOrderToMeCell.self, forCellWithReuseIdentifier: MyOrderToMeCell.identifier)
        collectionViewBack.snp.makeConstraints { make in
            make.top.equalTo(collectionViewTop.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        lazy var collectionHeader = CustomTransitView(transitLabel: "SK12353246", infoText: "On transit area", transitImage: "wal", caseText: "On Process", bigButtonText: "Track", currentVC: self, destinationVC: TrackVC())
        collectionViewBack.addSubview(collectionHeader)
        collectionHeader.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
    }
    @objc func changeView(_ segmentedController : UISegmentedControl){
        collectionViewBack.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var numberOfRow = 1
        switch collectionView{
        case collectionViewTop:
            numberOfRow = data.collectionTopArray.count
        case collectionViewBack:
            numberOfRow = segmentedController.selectedSegmentIndex == 0 ? data.imageArray.count : data.InboxPics.count
        default:
            print("row error")
        }
        return numberOfRow
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        if collectionView == self.collectionViewTop {
            let cellTop = collectionView.dequeueReusableCell(withReuseIdentifier: MyOrderTopCell.identifier, for: indexPath) as! MyOrderTopCell
            cellTop.collectionButton.setTitle(data.collectionTopArray[indexPath.row], for: .normal)
                return cellTop
            }
        else if collectionView == self.collectionViewBack{
            if segmentedController.selectedSegmentIndex == 0{
                let cellBack1 = collectionView.dequeueReusableCell(withReuseIdentifier: MyOrderToMeCell.identifier, for: indexPath) as! MyOrderToMeCell
                cellBack1.transitImg.image = data.imageArray[indexPath.row]
                cellBack1.transitLbl.text = data.transitCodeArray[indexPath.row]
                cellBack1.transitInfoLbl.text = data.transitInfoArray[indexPath.row]
                cellBack1.caseLabel.text = data.transitCase[indexPath.row]

                    return cellBack1
            }else{
                let cellBack2 = collectionView.dequeueReusableCell(withReuseIdentifier: MyOrderFromMeCell.identifier, for: indexPath) as! MyOrderFromMeCell

                    // ...Set up cell

                    return cellBack2
            }
            
            }
        return cell
    }
}



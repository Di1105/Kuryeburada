//
//  MyOrderVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 13.01.2023.
//

import UIKit
import SnapKit

class MyOrderVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

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
        
        lazy var searchBar = CustomSearchBar(placeholder: "Enter Track ID Number")
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(8)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        lazy var segmentedController = UISegmentedControl(items: data.itemsSegment)
        view.addSubview(segmentedController)
        segmentedController.backgroundColor = .secondaryGreen
        segmentedController.tintColor = .white
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
        collectionViewTop.register(CollectionTopCell.self, forCellWithReuseIdentifier: CollectionTopCell.identifier)
        collectionViewTop.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
            make.top.equalTo(segmentedController.snp.bottom).offset(16)
            make.height.equalTo(32)
        }
        
        let layoutBack = UICollectionViewFlowLayout()
        layoutBack.scrollDirection = .vertical
        layoutBack.minimumLineSpacing = 8
        layoutBack.headerReferenceSize = CGSize(width: view.frame.size.width, height: 160)
        layoutBack.itemSize = CGSize(width: ((view.frame.size.width)-32), height: 80)
        collectionViewBack = UICollectionView(frame: .zero, collectionViewLayout: layoutBack)
        view.addSubview(collectionViewBack)
        collectionViewBack.delegate = self
        collectionViewBack.dataSource = self
        collectionViewBack.backgroundColor = .white
        collectionViewBack.register(CollectionBackCell.self, forCellWithReuseIdentifier: CollectionBackCell.identifier)
        collectionViewBack.snp.makeConstraints { make in
            make.top.equalTo(collectionViewTop.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        lazy var collectionHeader = CustomTransitView(transitLabel: "SK12353246", infoText: "On transit area", transitImage: "wal", caseText: "On Process", bigButtonText: "Track")
        collectionViewBack.addSubview(collectionHeader)
        collectionHeader.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
                      
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var numberOfRow = 1
         switch collectionView{
         case collectionViewTop:
             numberOfRow = data.collectionTopArray.count
         case collectionViewBack:
             numberOfRow = data.transitCodeArray.count
         default:
             print("row error")
         }
         return numberOfRow
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        
        switch collectionView{
        case collectionViewTop:
            let cellTop = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionTopCell.identifier, for: indexPath) as! CollectionTopCell
            cellTop.collectionButton.setTitle(data.collectionTopArray[indexPath.row], for: .normal)
            return cellTop
        case collectionViewBack:
            let cellBack = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionBackCell.identifier, for: indexPath) as! CollectionBackCell
            cellBack.transitImg.image = data.imageArray[indexPath.row]
            cellBack.transitLbl.text = data.transitCodeArray[indexPath.row]
            cellBack.transitInfoLbl.text = data.transitInfoArray[indexPath.row]
            cellBack.caseLabel.text = data.transitCase[indexPath.row]
            return cellBack
        default:
            print("cell error")

        }
        

        
        
        return cell
    }
    
}

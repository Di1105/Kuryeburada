//
//  PinMapVC.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 12.01.2023.
//

import UIKit
import MapKit
import SnapKit


class PinMapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    var annotationTitle = ""
    var annotationSubtitle = ""
    var annotationLatitude = Double()
    var annotationLongitude = Double()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    

    func setupUI(){
        
        lazy var headerView = CustomHeaderView(text: "Pin your Address Location", currentVC: self, destinationVC: FillYourProfileVC())
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        lazy var continueButton = CustomPrimaryLargeButton(title: "Continue", currentVC: self, destinationVC: CreatePinVC())
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-32)
        }
        
        lazy var mapView = MKMapView()
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.bottom.equalTo(continueButton.snp.top)
            make.width.equalToSuperview()
        }
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        lazy var locationView = UIView()
        mapView.addSubview(locationView)
        locationView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(120)
            make.centerX.equalToSuperview()
        }
        locationView.backgroundColor = .white
        locationView.layer.cornerRadius = 20
        locationView.alpha = 0.8
        
        lazy var locationImage = UIImageView()
        locationView.addSubview(locationImage)
        locationImage.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        locationImage.image = UIImage(named: "tik")
        
        lazy var locationLabel = UILabel()
        locationView.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalTo(locationImage.snp.trailing).offset(8)
        }
        locationLabel.font = Font.labelFont()
        locationLabel.textColor = .primaryDarkBlue
        locationLabel.text = "Location"
        
        lazy var placeLabel = UILabel()
        locationView.addSubview(placeLabel)
        placeLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(2)
            make.leading.equalTo(locationLabel)
        }
        placeLabel.font = Font.header3()
        placeLabel.textColor = .primaryGreen
        placeLabel.text = "Istanbul,Turkey"
        
        lazy var searchBar = CustomSearchBar(placeholder: "Search")
        locationView.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-12)
        }
        
    }

}

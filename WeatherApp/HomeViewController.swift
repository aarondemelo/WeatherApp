//
//  ViewController.swift
//  WeatherApp
//
//  Created by Aaron demelo on 03/09/22.
//

import UIKit
import RxSwift
import SnapKit

class HomeViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .brown
    }
    
    fileprivate lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.backgroundColor = .white
            collectionView.alwaysBounceVertical = true
            collectionView.alwaysBounceHorizontal = false
            self.view.addSubview(collectionView)
            return collectionView
        }()
    

    private lazy var testNetwork: UIButton = {
        let btn = UIButton()
        btn.setTitle("TestWeather", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)

        btn.backgroundColor = UIColor.clear
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 16
        btn.rx.tap.subscribe(onNext: { _ in
            Task{
          //  let weatherData = await WeatherService().fetchWeatherDataForLocation(latitude: NSNumber(value: 15.496777), longitude: NSNumber(value: 73.827827))
                
                let places = await PlacesAutocompleteService().getGeoCodeDataFor(placeName: "Lon")
            }
        }).disposed(by: self.disposeBag)
        self.view.addSubview(btn)
        return btn
    }()
    
    override public func viewWillLayoutSubviews() {
        testNetwork.snp.updateConstraints { make in
            make.edges.equalTo(self.view)
        }
        

    }
    

}


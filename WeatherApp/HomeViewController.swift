//
//  ViewController.swift
//  WeatherApp
//
//  Created by Aaron demelo on 03/09/22.
//

import UIKit
import RxSwift


class HomeViewController: UIViewController {

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
    

    
    

}


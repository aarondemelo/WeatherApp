//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Aaron demelo on 09/09/22.
//

import Foundation

import RxSwift
import RxCocoa

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
}

class HomeViewModel:ViewModelType
{
      let input: Input
      let output: Output
      
      private let disposeable = DisposeBag()
      
      struct Input {
          let reload: PublishRelay<Void>
      }
      
      struct Output {
          let cityWeatherViewModels: Driver<[CityWeatherViewModel]>
          let error: Driver<String>
      }
    
    
    init() {
            
            let errorRelay = PublishRelay<String>()
            let reloadRelay = PublishRelay<Void>()
            
            
            self.input = Input(reload: reloadRelay)
            self.output = Output(cityWeatherViewModels: Driver.just([]), error: errorRelay.asDriver(onErrorJustReturn: "error happened"))
        }
    
}

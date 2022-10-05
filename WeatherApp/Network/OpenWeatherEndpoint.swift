//
//  OpenWeatherEndpoint.swift
//  WeatherApp
//
//  Created by Aaron demelo on 24/09/22.
//

import Foundation


enum OpenWeatherEndpoint: Endpoint
{
    
    case getCurrentWeather(latitude:NSNumber, longitude: NSNumber)
    case get5Day3HourForecast(latitude:NSNumber, longitude: NSNumber)
   
    var baseURL: String {
        switch self
        {
        default:
            return "api.openweathermap.org"
        }
    }
    
    
    var path: String
    {
        switch self
        {
        case let .getCurrentWeather(latitude, longitude) :
            return "data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)"
        case .get5Day3HourForecast(latitude: let latitude, longitude: let longitude):
            return "data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)"
        }
    }
    
    var parameters: [URLQueryItem]
    {
        switch self
        {
        default:
            return []
        }
    }
    
    var method: String
    {
        switch self
        {
        default:
            return "get"
        }
    }
    
    var apiKey: String
    {
        switch self
        {
        default:
            return ""
        }
    }
    
   
}

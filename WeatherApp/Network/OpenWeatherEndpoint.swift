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
        case .getCurrentWeather :
            return "/data/2.5/weather"
        case .get5Day3HourForecast:
            return "/data/2.5/forecast"
        }
    }
    
    var parameters: [URLQueryItem]
    {
        switch self
        {
        case let .getCurrentWeather(latitude, longitude) :
            return [
                URLQueryItem(name: "lat", value: latitude.stringValue),
                URLQueryItem(name: "lon", value: longitude.stringValue),
                URLQueryItem(name: "appid", value: apiKey)
                ]
        case let .get5Day3HourForecast(latitude, longitude):
            return [
                URLQueryItem(name: "lat", value: latitude.stringValue),
                URLQueryItem(name: "lon", value: longitude.stringValue),
                URLQueryItem(name: "appid", value: apiKey)
                ]
            
    
            
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
            return "testAPIID"
        }
    }
    
   
}

//
//  FirebasePlacesEndpoint.swift
//  WeatherApp
//
//  Created by Aaron demelo on 24/09/22.
//

import Foundation


enum FirebasePlacesEndpoint: Endpoint
{
    
    case getPlaces(name:String, limit:Int)
   
    var baseURL: String {
        switch self
        {
        default:
            return "placesgeocode-91942-default-rtdb.asia-southeast1.firebasedatabase.app"
        }
    }
    
    
    var path: String
    {
        switch self
        {
        case .getPlaces :
            return "/.json"
       
        }
    }
    
    var parameters: [URLQueryItem]
    {
        switch self
        {
        case let .getPlaces(name,limit) :
            return [
                URLQueryItem(name: "orderBy", value:
                            "\"name\""),
                URLQueryItem(name: "startAt", value:
                            "\"\(name)\""),
                URLQueryItem(name: "limitToFirst", value: limit.description),
                URLQueryItem(name: "auth", value: apiKey)
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

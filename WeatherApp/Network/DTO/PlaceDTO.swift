//
//  PlaceDTO.swift
//  WeatherApp
//
//  Created by Aaron demelo on 10/10/22.
//

import Foundation

// MARK: - WelcomeElement
public struct PlaceDTO: Codable {
    let country, name, lat, lng: String?
}

public typealias PlacesResultDictionary = [String: PlaceDTO]

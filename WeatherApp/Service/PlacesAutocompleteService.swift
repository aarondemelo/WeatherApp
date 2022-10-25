//
//  PlacesAutocompleteService.swift
//  WeatherApp
//
//  Created by Aaron demelo on 11/09/22.
//

import Foundation

public enum ParsingError: Error
{
    case fileNotFound
    case noMatchingData
    case invalidData
}


public class PlacesAutocompleteService
{

    
    public func getGeoCodeDataFor(placeName:String, limit:Int = 10) async -> Result<PlacesResultDictionary, NetworkError>
    {
        do
        {
            let placesData:PlacesResultDictionary = try await FirebasePlacesEndpoint.getPlaces(name: placeName, limit: limit).request()
            
            return .success(placesData)
            
        }
        catch let error as NetworkError{
            return .failure(error)
        }
        catch
        {
            return .failure(.invalidData)
        }
        
    }
    

}

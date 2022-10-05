//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Aaron demelo on 11/09/22.
//

import Foundation

public class WeatherService
{
    
    public func fetchWeatherDataForLocation(latitude:NSNumber,longitude:NSNumber) async
    {
        do
        {
            let currentWeatherData:CurrentWeatherDTO = try await OpenWeatherEndpoint.getCurrentWeather(latitude: latitude, longitude: longitude).request()
            
            let forecastWeatherData:Weather5Day3HourForecastDTO = try await OpenWeatherEndpoint.getCurrentWeather(latitude: latitude, longitude: longitude).request()
            
            
        }
        catch{}
        
    }
    
    
}

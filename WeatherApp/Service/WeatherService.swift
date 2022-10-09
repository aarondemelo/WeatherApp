//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Aaron demelo on 11/09/22.
//

import Foundation

public class WeatherService
{
    
    public func fetchWeatherDataForLocation(latitude:NSNumber,longitude:NSNumber) async -> Result<CompleteWeatherDataForLocation, NetworkError>
    {
        do
        {
            async let currentWeatherData:CurrentWeatherDTO = try await OpenWeatherEndpoint.getCurrentWeather(latitude: latitude, longitude: longitude).request()
            
            async let forecastWeatherData:Weather5Day3HourForecastDTO = try await OpenWeatherEndpoint.get5Day3HourForecast(latitude: latitude, longitude: longitude).request()
            
            return try await .success(CompleteWeatherDataForLocation(currentWeather: currentWeatherData, forecastWeatuer: forecastWeatherData))
            
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

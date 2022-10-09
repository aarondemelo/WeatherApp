//
//  MockedEndpoints.swift
//  WeatherApp
//
//  Created by Aaron demelo on 05/10/22.
//

#if DEBUG
import Foundation
import Mocker

public class MockedEndpoints
{
    
    static func mockWeatherDataEndpoint()
    {
        //https://api.openweathermap.org/data/2.5/weather?lat=15.496777&lon=73.827827&appid=c3b7e8ef95158c8756e2fe9adbb51537
        //https://api.openweathermap.org/data/2.5/forecast?lat=15.496777&lon=73.827827&appid=c3b7e8ef95158c8756e2fe9adbb51537
        
        MockedEndpoints.registerMockedEndpoint(url: "https://api.openweathermap.org/data/2.5/weather?lat=15.496777&lon=73.827827&appid=testAPIID", fileName: "CurrentWeatherData")
        
        MockedEndpoints.registerMockedEndpoint(url: "https://api.openweathermap.org/data/2.5/forecast?lat=15.496777&lon=73.827827&appid=testAPIID", fileName: "ForecastWeatherData")
    }
    
    
    
    static func registerMockedEndpoint(url:String,fileName:String)
    {
        let apiEndpoint = URL(string: url)!
        
        //Empty Records
        var mockedData = Data()
        
        if let data = MockedEndpoints.readJSONDATA(from: fileName) {
            mockedData = data
        }
        let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: mockedData])
        mock.register()
        
    }
}

extension MockedEndpoints {
    
    static func readJSONDATA(from file: String) -> Data? {
        let bundle = Bundle(for: self)
        guard let url = bundle.url(forResource: file, withExtension: "json"),
            let jsonData = try? Data(contentsOf: url) else {return nil}
        return jsonData
        
    }
}

#endif

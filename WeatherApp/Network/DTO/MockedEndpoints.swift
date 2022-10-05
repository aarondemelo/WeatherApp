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

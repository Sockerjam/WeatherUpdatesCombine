//
//  Service.swift
//  WeatherCombine
//
//  Created by Niclas Jeppsson on 26/05/2022.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL(String)
    case transportError(Error)
}

enum API {
    static let key = ""
}

class Services {
    
    static func fetchWeatherData(from city: String) -> AnyPublisher<WeatherResponse, NetworkError> {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(API.key)") else {
            return Fail(error: NetworkError.invalidURL("URL Invalid"))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .mapError{ error -> NetworkError in
                NetworkError.transportError(error)
            }
            .eraseToAnyPublisher()
    }
    
}

//
//  WeatherData.swift
//  WeatherCombine
//
//  Created by Niclas Jeppsson on 26/05/2022.
//

import Foundation

struct WeatherResponse: Codable {
    
    let main: Temperature
    let weather: [Weather]
    let name: String
    
}

struct Weather: Codable {
    
    let description: String
    let main: String
}

struct Temperature: Codable {
    
    let temperature: Float
    let feelsLike: Float
    
    enum CodingKeys: String, CodingKey {
        case feelsLike = "feels_like"
        case temperature = "temp"
    }
}

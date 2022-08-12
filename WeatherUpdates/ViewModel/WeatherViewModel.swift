//
//  WeatherViewModel.swift
//  WeatherCombine
//
//  Created by Niclas Jeppsson on 26/05/2022.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    enum Weather {
        case success(WeatherResponse)
        case failure(NetworkError)
        case initial
    }
    
    @Published var city: String = ""
    @Published var weather: Weather = .initial
    
    private var cancellable: AnyCancellable?
    
    private lazy var fetchWeatherData: AnyPublisher<Result<WeatherResponse, NetworkError>, Never> = {
        $city
            .debounce(for: 1, scheduler: DispatchQueue.main)
            .filter { $0.count > 1 }
            .removeDuplicates()
            .flatMap { city -> AnyPublisher<Result<WeatherResponse, NetworkError>, Never> in
                Services.fetchWeatherData(from: city)
                    .asResult()
            }
            .eraseToAnyPublisher()
    }()
    
    init() {
        
       subscribe()
    }
    
    private func subscribe() {
        
        cancellable = fetchWeatherData
            .receive(on: RunLoop.main)
            .sink { weatherData in
                switch weatherData {
                case .failure(let error):
                    self.weather = .failure(error)
                case .success(let weatherResponse):
                    self.weather = .success(weatherResponse)
                }
            }
    }
    
}

//
//  ContentView.swift
//  WeatherUpdates
//
//  Created by Niclas Jeppsson on 30/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: WeatherViewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            switch viewModel.weather {
            case .success(let weatherResponse):
                WeatherView(city: $viewModel.city, weatherResponse: weatherResponse)
            case .failure(let error):
                ErrorMessageView(city: $viewModel.city, errorMessage: error)
            case .initial:
                Start(city: $viewModel.city)
            }
        }.environmentObject(viewModel)
    }
}

//
//  WeatherView.swift
//  WeatherUpdates
//
//  Created by Niclas Jeppsson on 06/06/2022.
//

import SwiftUI

struct WeatherView: View {
    
    @Binding var city: String
    
    var weatherResponse: WeatherResponse
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Weather In \(weatherResponse.name)")
                .font(.largeTitle)
                .padding(10)
            Text("Temperature: " + String(format: "%.1f", weatherResponse.main.temperature) + "°C")
            Text("Feels Like: " + String(format: "%.1f", weatherResponse.main.feelsLike) + "°C")
            TextField("Enter City", text: $city)
                .multilineTextAlignment(.center)
                .disableAutocorrection(true)
                .frame(width: 200, height: 30)
                .background(.pink)
                .cornerRadius(20)
        }.navigationTitle("Weather")
    }
}

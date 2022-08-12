//
//  ErrorMessage.swift
//  WeatherUpdates
//
//  Created by Niclas Jeppsson on 06/06/2022.
//

import SwiftUI

struct ErrorMessageView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    @Binding var city: String
    
    var errorMessage: NetworkError
    
    var body: some View {
        VStack {
            Text("City not found. Try again \(errorMessage.localizedDescription)")
                .font(.subheadline)
                .foregroundColor(.red)
            TextField("Enter City", text: $city)
                .multilineTextAlignment(.center)
                .disableAutocorrection(true)
                .frame(width: 200, height: 30)
                .background(.pink)
                .cornerRadius(20)
        }
        .navigationTitle("Error")
    }
    
}

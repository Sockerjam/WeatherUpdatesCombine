//
//  Start.swift
//  WeatherUpdates
//
//  Created by Niclas Jeppsson on 09/06/2022.
//

import SwiftUI

struct Start: View {
    
    @Binding var city: String
    
    var body: some View {
        
        TextField("Enter City", text: $city)
            .disableAutocorrection(true)
            .multilineTextAlignment(.center)
            .frame(width: 200, height: 30)
            .background(.pink)
            .cornerRadius(20)
    }
}

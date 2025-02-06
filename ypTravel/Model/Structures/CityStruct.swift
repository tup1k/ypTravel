//
//  Untitled.swift
//  ypTravel
//
//  Created by Олег Кор on 06.02.2025.
//
import SwiftUI


struct City: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct CityDetails: View {
    var city: City
    
    var body: some View {
        Text(city.name)
            .font(.title)
            .navigationTitle(city.name)
        Text("Details for \(city.name)")
    }
}

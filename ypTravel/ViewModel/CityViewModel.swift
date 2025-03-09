//
//  CityViewModel.swift
//  ypTravel
//
//  Created by Олег Кор on 06.02.2025.
//

import Foundation

final class CityViewModel: ObservableObject {
    var networkViewModel = DataNetworkService()
    @Published var cities: [AllCitiesStruct] = []
    
    
    init() {
        Task {
            await loadCities()
        }
    }
   
    func loadCities() async {
           let fetchedCities = await networkViewModel.allStations()
           DispatchQueue.main.async {
               self.cities = fetchedCities
           }
       }
    
    
}

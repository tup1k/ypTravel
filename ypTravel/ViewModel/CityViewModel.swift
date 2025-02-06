//
//  CityViewModel.swift
//  ypTravel
//
//  Created by Олег Кор on 06.02.2025.
//
import UIKit

class CityViewModel: ObservableObject {
    @Published var cities: [City] = []
    
    init() {
        let city_1 = City(name: "Москва")
        let city_2 = City(name: "Санкт Петербург")
        let city_3 = City(name: "Сочи")
        let city_4 = City(name: "Горный воздух")
        let city_5 = City(name: "Краснодар")
        let city_6 = City(name: "Казань")
        let city_7 = City(name: "Омск")
        
        self.cities = [city_1, city_2, city_3, city_4, city_5, city_6, city_7]
    }
}

//
//  CityViewModel.swift
//  ypTravel
//
//  Created by Олег Кор on 06.02.2025.
//

import SwiftUI

class CityViewModel: ObservableObject {
    @Published var cities: [City] = []
    
    init() {
        let city_1 = City(name: "Москва", stations: [Station(name: "Ленинградский вокзал"), Station(name: "Казанский вокзал"), Station(name: "Киевский вокзал"), Station(name: "Савеловский вокзал"), Station(name: "Белорусский вокзал"), Station(name: "Ярославский вокзал")])
        let city_2 = City(name: "Санкт Петербург", stations: [Station(name: "Московский вокзал"), Station(name: "Финляндский вокзал"), Station(name: "Ладожский вокзал"), Station(name: "Витебский вокзал"), Station(name: "Балтийский вокзал")])
        let city_3 = City(name: "Сочи", stations: [Station(name: "Вокзал Сочи")])
        let city_4 = City(name: "Горный воздух", stations: [Station(name: "Станция Горный Воздух")])
        let city_5 = City(name: "Краснодар", stations: [Station(name: "Вокзал Краснодара")])
        let city_6 = City(name: "Казань", stations: [Station(name: "Вокзал Казани")])
        let city_7 = City(name: "Омск", stations: [Station(name: "Вокзал Омска")])
        
        self.cities = [city_1, city_2, city_3, city_4, city_5, city_6, city_7]
    }
}

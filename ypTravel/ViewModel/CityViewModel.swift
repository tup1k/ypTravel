//
//  CityViewModel.swift
//  ypTravel
//
//  Created by Олег Кор on 06.02.2025.
//

import Foundation

final class CityViewModel: ObservableObject {
    @Published var cities: [City] = []
    
    init() {
        let moscow = City(name: "Москва", stations: [Station(name: "Ленинградский вокзал"), Station(name: "Казанский вокзал"), Station(name: "Киевский вокзал"), Station(name: "Савеловский вокзал"), Station(name: "Белорусский вокзал"), Station(name: "Ярославский вокзал")])
        let spb = City(name: "Санкт Петербург", stations: [Station(name: "Московский вокзал"), Station(name: "Финляндский вокзал"), Station(name: "Ладожский вокзал"), Station(name: "Витебский вокзал"), Station(name: "Балтийский вокзал")])
        let sochi = City(name: "Сочи", stations: [Station(name: "Вокзал Сочи")])
        let gv = City(name: "Горный воздух", stations: [Station(name: "Станция Горный Воздух")])
        let krasnodar = City(name: "Краснодар", stations: [Station(name: "Вокзал Краснодара")])
        let kazan = City(name: "Казань", stations: [Station(name: "Вокзал Казани")])
        let omsk = City(name: "Омск", stations: [Station(name: "Вокзал Омска")])
        
        self.cities = [moscow, spb, sochi, gv, krasnodar, kazan, omsk]
    }
}

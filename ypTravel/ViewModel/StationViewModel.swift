//
//  StationViewModel.swift
//  ypTravel
//
//  Created by Олег Кор on 09.02.2025.
//

import UIKit
import SwiftUICore

class StationViewModel: ObservableObject {
    @Published var moscowStation: [Station] = []
    @Published var spbStation: [Station] = []
    @Published var sochiStation: [Station] = []
    @Published var gvStation: [Station] = []
    @Published var krasnodarStation: [Station] = []
    @Published var kazanStation: [Station] = []
    @Published var omskStation: [Station] = []
    
    init() {
        let moscowStation = [Station(name: "Ленинградский вокзал"), Station(name: "Казанский вокзал"), Station(name: "Киевский вокзал"), Station(name: "Савеловский вокзал"), Station(name: "Белорусский вокзал"), Station(name: "Ярославский вокзал")]
        let spbStation =  [Station(name: "Московский вокзал"), Station(name: "Финляндский вокзал"), Station(name: "Ладожский вокзал"), Station(name: "Витебский вокзал"), Station(name: "Балтийский вокзал")]
        let sochiStation = [Station(name: "Вокзал Сочи")]
        let gvStation = [Station(name: "Станция Горный Воздух")]
        let krasnodarStation = [Station(name: "Вокзал Краснодара")]
        let kazanStation = [Station(name: "Вокзал Казани")]
        let omskStation = [Station(name: "Вокзал Омска")]
    }
}

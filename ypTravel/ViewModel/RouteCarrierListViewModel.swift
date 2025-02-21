//
//  CarrierViewModel.swift
//  ypTravel
//
//  Created by Олег Кор on 06.02.2025.
//

import Foundation

final class RouteCarrierListViewModel: ObservableObject {
    @Published var carrierList: [RouteCarrierStruct] = []
    
    init() {
        let rzd = RouteCarrierStruct(carrierImage: "RZD", carrierName: "РЖД", transferInfo: "С пересадкой в Костроме", routeDate: "14 января", routeStartTime: "22:30", routeEndTime: "08:15", routeDuration: "20")
        let fgk = RouteCarrierStruct(carrierImage: "FGK", carrierName: "ФГК", transferInfo: "", routeDate: "15 января", routeStartTime: "01:15", routeEndTime: "09:00", routeDuration: "9")
        let ural = RouteCarrierStruct(carrierImage: "URAL", carrierName: "Урал логистика", transferInfo: "", routeDate: "16 января", routeStartTime: "12:30", routeEndTime: "21:00", routeDuration: "9")
        let rzd_2 = RouteCarrierStruct(carrierImage: "RZD", carrierName: "РЖД", transferInfo: "С пересадкой в Костроме", routeDate: "17 января", routeStartTime: "22:30", routeEndTime: "08:15", routeDuration: "20")
        let rzd_3 = RouteCarrierStruct(carrierImage: "RZD", carrierName: "РЖД", transferInfo: "", routeDate: "17 января", routeStartTime: "23:45", routeEndTime: "09:30", routeDuration: "20")
       
        self.carrierList = [rzd, fgk, ural, rzd_2, rzd_3]
    }
}

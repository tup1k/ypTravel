//
//  CarrierViewModel.swift
//  ypTravel
//
//  Created by Олег Кор on 06.02.2025.
//

import UIKit

class RouteCarrierListViewModel: ObservableObject {
    @Published var carrierList: [RouteCarrierStruct] = []
    
    init() {
        let carrier_1 = RouteCarrierStruct(carrierImage: "RZD", carrierName: "РЖД", transferInfo: "С пересадкой в Костроме", routeDate: "14 января", routeStartTime: "22:30", routeEndTime: "08:15", routeDuration: "20")
        let carrier_2 = RouteCarrierStruct(carrierImage: "FGK", carrierName: "ФГК", transferInfo: "", routeDate: "15 января", routeStartTime: "01:15", routeEndTime: "09:00", routeDuration: "9")
        let carrier_3 = RouteCarrierStruct(carrierImage: "URAL", carrierName: "Урал логистика", transferInfo: "", routeDate: "16 января", routeStartTime: "12:30", routeEndTime: "21:00", routeDuration: "9")
        let carrier_4 = RouteCarrierStruct(carrierImage: "RZD", carrierName: "РЖД", transferInfo: "С пересадкой в Костроме", routeDate: "17 января", routeStartTime: "22:30", routeEndTime: "08:15", routeDuration: "20")
        let carrier_5 = RouteCarrierStruct(carrierImage: "RZD", carrierName: "РЖД", transferInfo: "", routeDate: "17 января", routeStartTime: "23:45", routeEndTime: "09:30", routeDuration: "20")
       
        self.carrierList = [carrier_1, carrier_2, carrier_3, carrier_4, carrier_5]
    }
}

//
//  CarrierCellStruct.swift
//  ypTravel
//
//  Created by Олег Кор on 06.02.2025.
//

import Foundation

struct RouteCarrierStruct: Hashable, Identifiable {
    let id = UUID()
    let carrierImage: String
    let carrierName: String
    let transferInfo: String
    let routeDate: String
    let routeStartTime: String
    let routeEndTime: String
    let routeDuration: String
}

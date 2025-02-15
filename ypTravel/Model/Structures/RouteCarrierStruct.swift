//
//  CarrierCellStruct.swift
//  ypTravel
//
//  Created by Олег Кор on 06.02.2025.
//

import SwiftUI
import UIKit

struct RouteCarrierStruct: Hashable, Identifiable {
    let id = UUID()
    var carrierImage: String
    var carrierName: String
    var transferInfo: String
    var routeDate: String
    var routeStartTime: String
    var routeEndTime: String
    var routeDuration: String
}

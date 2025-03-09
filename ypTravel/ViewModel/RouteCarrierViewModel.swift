//
//  CarrierViewModel.swift
//  ypTravel
//
//  Created by Олег Кор on 06.02.2025.
//

import Foundation
import SwiftUI

final class RouteCarrierViewModel: ObservableObject {
    var networkViewModel = DataNetworkService()
    let isoFormatter = ISO8601DateFormatter()
    var codeOutput: String = "s2006004"
    var codeInput: String = "s9602494"
   var isShowWithTransfers: Bool?
    
    @Published var carrierList: [RouteCarrierStruct]
    
    var carrierArray: [RouteCarrierStruct] {
        if isShowWithTransfers ?? true == true {
            return carrierList
        } else {
            return carrierList.filter { $0.transferInfo.isEmpty }
        }
    }
    
    
    /// Форматирование времени в ячейке
       private var timeFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "HH:mm"
           return formatter
       }()
    
    /// Форматирование времени в ячейке
       private var dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "d MMMM"
           formatter.locale = Locale(identifier: "ru_RU")
           return formatter
       }()
    
    init() {
        carrierList = []
        
        Task {
            let fetchedRoutes = await networkViewModel.scheduleBetweenStations(fromStationCode: codeOutput, toStationCode: codeInput)
           
                for segment in fetchedRoutes.segments ?? [] {
                    let start_time = timeFormatter.string(from: isoFormatter.date(from: segment.departure ?? "") ?? Date())
                    let stop_time = timeFormatter.string(from: isoFormatter.date(from: segment.arrival ?? "") ?? Date())
                    let routeDay = dateFormatter.string(from: isoFormatter.date(from: segment.departure ?? "") ?? Date())
                    
//                    guard let imageURLString = segment.thread?.carrier?.logo,
//                          let imageURL = URL(string: imageURLString) else { return }
                    
                    let newRoute = RouteCarrierStruct(
                        carrierImage: "RZD",
                        carrierName: segment.thread?.carrier?.title ?? "Test",
                        transferInfo: "Без пересадок",
                        routeDate: routeDay,
                        routeStartTime: start_time,
                        routeEndTime: stop_time,
                        routeDuration: String(format: "%.f", Double(segment.duration ?? 0) / 3600),
                        carrierCode: String(segment.thread?.carrier?.code ?? 112)
                    )
                    carrierList.append(newRoute)
                }
        }
    }
}

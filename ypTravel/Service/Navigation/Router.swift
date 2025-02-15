//
//  Router.swift
//  ypTravel
//
//  Created by Олег Кор on 14.02.2025.
//

import SwiftUI

struct Router {
    @ViewBuilder
    static func destination(for screen: ListOfView) -> some View {
        switch screen {
        case .homeView:
            EmptyView()
        case .cityView(let isFrom):
            CitySelectionView(isFrom: isFrom)
//        case .stationView:
//            StationSelectionView(selectedCityStations: <#[Station]#>)
//        case .routeCarrierView:
//            CarrierListView(from: "Москва", to: "Санкт-Петербург")
//        case .filterView:
//            RouteTimeSelectionView()
//        case .carrierInfoView:
//            CarrierInfoView()
        
        }
    }
}

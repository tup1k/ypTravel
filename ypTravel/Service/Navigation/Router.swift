//
//  Router.swift
//  ypTravel
//
//  Created by Олег Кор on 14.02.2025.
//

import SwiftUI

struct Router {
    @ViewBuilder
    static func destination(for screen: ListOfView, fromPlace: Binding<String>, toPlace: Binding<String>) -> some View {
        switch screen {
        case .homeView:
            EmptyView()
        case .cityView(let isFrom):
            CitySelectionView(isFrom: isFrom)
        case .stationView(let selectedCity, let selectedCityStations, let isFrom):
            StationSelectionView(selectedStation: isFrom ? fromPlace : toPlace, selectedCity: selectedCity, selectedCityStations: selectedCityStations, isFrom: isFrom)
//        case .routeCarrierView:
//            CarrierListView(from: "Москва", to: "Санкт-Петербург")
//        case .filterView:
//            RouteTimeSelectionView()
//        case .carrierInfoView:
//            CarrierInfoView()
        
        }
    }
}

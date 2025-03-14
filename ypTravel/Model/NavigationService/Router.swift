import SwiftUI

@MainActor
struct Router {
    @ViewBuilder
    static func destination(for screen: ListOfView, fromCity: Binding<City> ,fromPlace: Binding<Station>, toCity: Binding<City>, toPlace: Binding<Station>) -> some View {
        switch screen {
        case .homeView:
            EmptyView()
        case .cityView(let isFrom):
            CitySelectionView(selectedCity: isFrom ? fromCity : toCity, isFrom: isFrom)
        case .stationView(let stations, let isFrom):
            StationSelectionView(stations: stations, selectedStation: isFrom ? fromPlace : toPlace, isFrom: isFrom)
//        case .routeCarrierView:
//            CarrierListView(from: "Москва", to: "Санкт-Петербург")
//        case .filterView:
//            RouteTimeSelectionView()
//        case .carrierInfoView:
//            CarrierInfoView()
        
        }
    }
}

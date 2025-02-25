//
//  NavigationModel.swift
//  ypTravel
//
//  Created by Олег Кор on 14.02.2025.
//
import SwiftUI

enum ListOfView: Hashable {
    case homeView
    case cityView(Bool)
    case stationView(String, [Station], Bool)
//    case routeCarrierView
//    case filterView
//    case carrierInfoView
}

final class NavigationModel: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ actualView: ListOfView) {
        path.append(actualView)
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
}

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
//    case stationView
//    case routeCarrierView
//    case filterView
//    case carrierInfoView
}

class NavigationModel: ObservableObject {
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

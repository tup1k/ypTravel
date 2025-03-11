import SwiftUI

@MainActor
final class FindTheRouteViewModel: ObservableObject {
    @Published var fromCity: City
    @Published var fromStation: Station
    @Published var toCity: City
    @Published var toStation: Station
 
    
    init(fromCity: City, toCity: City, fromStation: Station, toStation: Station) {
        self.fromCity = fromCity
        self.fromStation = fromStation
        self.toCity = toCity
        self.toStation = toStation
    }
}

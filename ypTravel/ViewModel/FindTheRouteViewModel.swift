import Foundation

@MainActor
final class FindTheRouteViewModel: ObservableObject {
    @Published var fromPlace: Station
    @Published var toPlace: Station
    
    init(fromPlace: Station, toPlace: Station) {
        self.fromPlace = fromPlace
        self.toPlace = toPlace
    }
}

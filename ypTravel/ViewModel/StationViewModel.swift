import Foundation

final class StationViewModel: ObservableObject {
    @Published var stations: [Station]
    @Published var searchText: String = ""
    
    var stationArray: [Station] {
        searchText.isEmpty
        ? stations
        : stations.filter { $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    init(stations: [Station]) {
        self.stations = stations
    }
}


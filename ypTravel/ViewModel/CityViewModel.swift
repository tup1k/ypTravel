import Foundation

@MainActor
final class CityViewModel: ObservableObject {
    @Published var cities: [City] = []
    @Published var searchText: String = ""
    var networkViewModel = DataNetworkService()
    private var newStations: [Station] = []
    
    var cityArray: [City] {
        let filteresCities = searchText.isEmpty ? cities : cities.filter { city in
            let cityTitleString = city.name
            let cityTitle = cityTitleString.lowercased()
            return cityTitle.contains(searchText.lowercased())
        }
        return filteresCities.sorted {($0.name).localizedCaseInsensitiveCompare($1.name) == .orderedAscending  }
    }
    
    init() {
        Task {
            await loadCities()
        }
    }
   
    func loadCities() async {
        let fetchedCities = await networkViewModel.allStations()
        for city in fetchedCities {
            for station in city.stations ?? [] {
                let oneMoreStation = Station(name: station.title ?? "Название станции отсутствует", code: station.code ?? "")
                self.newStations.append(oneMoreStation)
            }
            let newCity = City(name: city.title ?? "Название города отсутствует", stations: newStations)
            self.cities.append(newCity)
        }
        
    }
}

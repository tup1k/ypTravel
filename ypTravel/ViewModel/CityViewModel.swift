import Foundation

@MainActor
final class CityViewModel: ObservableObject {
    @Published var cities: [City] = CommonData.shared.commonCities
    @Published var searchText: String = ""
    var networkViewModel = DataNetworkService()
    private var newStations: [Station] = []
    private var cityName: String = ""
    
    var cityArray: [City] {
        let filteresCities = searchText.isEmpty ? cities : cities.filter { city in
            let cityTitleString = city.name
            let cityTitle = cityTitleString.lowercased()
            return cityTitle.contains(searchText.lowercased())
        }
        return filteresCities.sorted {($0.name).localizedCaseInsensitiveCompare($1.name) == .orderedAscending  }
    }
    
//    init() {
//        Task {
//            await loadCities()
//        }
//    }
   
//    func loadCities() async throws {
//        
//        do {
//            let fetchedCities = try await networkViewModel.allStations()
//            
//            for city in fetchedCities {
//                for station in city.stations ?? [] {
//                    let oneMoreStation = Station(name: station.title ?? "Название станции отсутствует", code: station.codes?.yandex_code ?? "")
//                    self.newStations.append(oneMoreStation)
//                }
//                if city.title == nil || city.title == "" {
//                    cityName = "Название города отсутствует"
//                } else {
//                    cityName = city.title ?? "Название города отсутствует"
//                }
//                let newCity = City(name: cityName, stations: newStations)
//                self.cities.append(newCity)
//                newStations.removeAll()
//            }
//            
//            CommonData.shared.commonCities = cities
//            
//        } catch {
//            print(error.localizedDescription)
//            throw error
//        }
//        
//    }
}

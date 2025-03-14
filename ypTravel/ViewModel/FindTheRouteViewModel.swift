import SwiftUI

@MainActor
final class FindTheRouteViewModel: ObservableObject {
    @Published var fromCity: City
    @Published var fromStation: Station
    @Published var toCity: City
    @Published var toStation: Station
    @Published var allCities: [City] = []
    @Published var isLoading: Bool = false
    private var isLoaded: Bool = false
    private var newStations: [Station] = []
    private var cityName: String = ""
   
 
    
    init(fromCity: City, toCity: City, fromStation: Station, toStation: Station) {
        self.fromCity = fromCity
        self.fromStation = fromStation
        self.toCity = toCity
        self.toStation = toStation
    }
    
    func loadCities() async throws {
        guard !isLoaded else { return }
        isLoading = true
        isLoaded = true
        
        defer {
            isLoading = false
        }
        
        do {
            let fetchedCities = try await DataNetworkService.shared.allStations()
            
            for city in fetchedCities {
                for station in city.stations ?? [] {
                    let oneMoreStation = Station(name: station.title ?? "Название станции отсутствует", code: station.codes?.yandex_code ?? "")
                    self.newStations.append(oneMoreStation)
                }
                if city.title == nil || city.title == "" {
                    cityName = "Название города отсутствует"
                } else {
                    cityName = city.title ?? "Название города отсутствует"
                }
                let newCity = City(name: cityName, stations: newStations)
                self.allCities.append(newCity)
                newStations.removeAll()
            }
            
            CommonData.shared.commonCities = allCities
            
        } catch {
            print("Ошибка сохранения массива городов и станций: \(error.localizedDescription)")
            throw error
        }
        
    }
}

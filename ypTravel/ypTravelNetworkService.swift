// 1. Импортируем библиотеки
import OpenAPIRuntime
import OpenAPIURLSession
import Foundation

// 2. Улучшаем читаемость кода — необязательный шаг
typealias NearestStations = Components.Schemas.Stations
typealias TwoStationSchedule = Components.Schemas.Segments
typealias OneStationSchedule = Components.Schemas.ScheduleResponse
typealias StationsOnTheRoute = Components.Schemas.ThreadStationsResponse
typealias NearestSettlementInfo = Components.Schemas.NearestCityResponse
typealias CarrierInfo = Components.Schemas.CarrierResponse
typealias StationInfo = Components.Schemas.AllStationsResponse
typealias CopyrightInfo = Components.Schemas.CopyrightResponse

protocol ypTravelNetworkServiceProtocol {
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
    func getScheduleBetweenStations(from: String, to: String) async throws -> TwoStationSchedule
    func getStationSchedule(station: String) async throws -> OneStationSchedule
    func getRouteStations(uid: String) async throws -> StationsOnTheRoute
    func getNearestCity(lat: Double, lng: Double) async throws -> NearestSettlementInfo
    func getCarrierInfo(code: String) async throws -> CarrierInfo
    func getAllStations() async throws -> StationInfo
    func getCopyright() async throws -> CopyrightInfo
}

final class YPTravelNetworkService: ypTravelNetworkServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    /// Расписание рейсов между станциями
    func getScheduleBetweenStations(from: String, to: String) async throws -> TwoStationSchedule {
        let response = try await client.getScheduleBetweenStations(query: .init(
            apikey: apikey,
            from: from,
            to: to,
            date: "2025-01-25"
        ))
        print(try response.ok.body.json)
        return try response.ok.body.json
    }
    
    /// Список рейсов у станции
    func getStationSchedule(station: String) async throws -> OneStationSchedule {
        let response = try await client.getStationSchedule(query: .init(
            apikey: apikey,
            station: station,
            date: "2025-01-22"
        ))
        return try response.ok.body.json
    }
    
    /// Список станций на маршруте
    func getRouteStations(uid: String) async throws -> StationsOnTheRoute {
        let response = try await client.getRouteStations(query: .init(
            apikey: apikey,
            uid: uid
        ))
        print(try response.ok.body.json)
        return try response.ok.body.json
    }
    
    /// Список ближайших станций
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        let response = try await client.getNearestStations(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng,
            distance: distance
        ))
        return try response.ok.body.json
    }
    
    /// Ближайший город по координатам
    func getNearestCity(lat: Double, lng: Double) async throws -> NearestSettlementInfo {
        let response = try await client.getNearestCity(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng
        ))
        return try response.ok.body.json
    }
    
    /// Информация о перевозчике
    func getCarrierInfo(code: String) async throws -> CarrierInfo {
        let response = try await client.getCarrierInfo(query: .init(
            apikey: apikey,
            code: code
        ))
        print(response)
        return try response.ok.body.json
    }
    
   /// Информация о всех станциях
    func getAllStations() async throws -> StationInfo {
        var data = Data()
        
        do {
            let response = try await client.getAllStations(query: .init(apikey: apikey))
            print(response)
            
            for try await chunk in try response.ok.body.text_html_charset_utf_hyphen_8 {
                data.append(contentsOf: chunk)
            }
            
            let decoder = JSONDecoder()
            let stationInfo = try decoder.decode(StationInfo.self, from: data)
            return stationInfo
        } catch {
            print("Запрос выдал ошибку: \(error)")
            throw error
        }
    }
    
    /// Копирайт Яндекс Расписаний
    func getCopyright() async throws -> CopyrightInfo {
        let response = try await client.getCopyright(query: .init(apikey: apikey))
        return try response.ok.body.json
    }
}


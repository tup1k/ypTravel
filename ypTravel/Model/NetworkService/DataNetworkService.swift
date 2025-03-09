//
//  DataNetworkService.swift
//  ypTravel
//
//  Created by Олег Кор on 09.02.2025.
//

import SwiftUI
import OpenAPIURLSession

struct DataNetworkService {
    private let client: Client
    private let service: YPTravelNetworkService
    
    init () {
        do {
            client = Client(serverURL: try Servers.Server1.url(), transport: URLSessionTransport())
            service = YPTravelNetworkService(client: self.client, apikey: Constants.apiKey)
        } catch {
            fatalError("Ошибка при получении URL сервера: \(error.localizedDescription)")
        }
    }
    

    /// Метод вывода расписания рейсов между двумя остановками
    func scheduleBetweenStations(fromStationCode: String, toStationCode: String) async -> TwoStationSchedule {
//        Task {
            do {
                let schedule = try await service.GetScheduleBetweenStations(from: fromStationCode, to: toStationCode)
//                let schedule = try await service.GetScheduleBetweenStations(from: fromStation, to: toStation)
                return schedule
            } catch {
                print(error)
                return TwoStationSchedule(segments: nil)
            }
//        }
    }
    
    /// Метод вывода списка рейсов проходящих через остановку
    private func stationSchedule() {
        Task {
            do {
                let schedule = try await service.GetStationSchedule(station: "s9600213")
                print(schedule.schedule ?? "No data")
            } catch {
                print(error)
            }
        }
    }
    
    /// Метод вывода списка остановок на маршруте
    private func routeStations() {
        Task {
            do {
                let stations = try await service.GetRouteStations(uid: "028S_3_2")
                print(stations.title ?? "No stations data")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    /// Метод вывода ближайшей остановки
    private func nearestStations() {
        Task {
            let stations = try await service.GetNearestStations(lat: 55.813902, lng: 37.597299, distance: 5)
            print(stations.stations ?? "No data")
        }
    }
    
    /// Метод вывода ближайшего города
    private func nearestCity() {
        Task {
            let settlements = try await service.GetNearestCity(lat: 55.813902, lng: 37.597299)
            print(settlements.title ?? "No city data")
        }
    }
    
    /// Метод вывода информации о перевозчике
//    func carrierInfo(code: String) async -> CarrierInfo {
    func carrierInfo(code: String) async -> CarrierInfoStruct {
        do {
            let carrierInfo = try await service.GetCarrierInfo(code: code)
            
            let jsonData = try JSONSerialization.data(withJSONObject: carrierInfo.carrier?.value as? [String: Any], options: [])
            let decoder = JSONDecoder()
            let carrierResponse = try decoder.decode(CarrierResponseStruct.self, from: jsonData)
            let carrierList = CarrierInfoStruct(carrierImage: "RZD", carrierName: carrierResponse.title ?? "", carrierMail: carrierResponse.email ?? "", carrierPhone: carrierResponse.phone ?? "")
            return carrierList
        } catch {
            print(error.localizedDescription)
            return CarrierInfoStruct(carrierImage: "", carrierName: "", carrierMail: "", carrierPhone: "")
        }
    }
    
    /// Метод вывода всех доступных остановок
    func allStations() async -> [AllCitiesStruct] {
//        Task {
            do {
                let stations = try await service.GetAllStations()
                let rusArray = stations.countries?.filter { $0.title == "Россия" }
                return rusArray?.first?.regions?.flatMap { $0.settlements ?? [] } ?? []
            } catch {
                print(error.localizedDescription)
                return []
            }
//        }
    }
    
    
    /// Метод вывода копирайтов яндекса
    private func copyrights() {
        Task {
            let copyrights = try await service.GetCopyright()
            print(copyrights.copyright ?? "No copyright data")
        }
    }
}
    

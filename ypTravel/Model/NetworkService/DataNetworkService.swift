//
//  DataNetworkService.swift
//  ypTravel
//
//  Created by Олег Кор on 09.02.2025.
//

import SwiftUI
import OpenAPIURLSession

struct DataNetworkService: View {
    private let client: Client
    private let service: YPTravelNetworkService
    
    
    init () {
        do {
            client = Client(serverURL: try Servers.Server1.url(), transport: URLSessionTransport())
            service = YPTravelNetworkService(client: self.client, apikey: Constants.apiKey)
        } catch {
            fatalError()
        }
    }
 
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button("Вывести расписание рейсов между станциями (scheduleBetweenStations)") {
                scheduleBetweenStations()
            }.padding()
            Button("Вывести список рейсов у станции (stationSchedule)") {
                stationSchedule()
            }.padding()
            Button("Вывести список станций на маршруте (routeStations)") {
                routeStations()
            }.padding()
            Button("Вывести ближайшие станции (nearestStations)") {
                nearestStations()
            }.padding()
            Button("Вывести ближайший город (nearestCity)") {
                nearestCity()
            }.padding()
            Button("Вывести данные о перевозчике на маршруте (carrierInfo)") {
                carrierInfo()
            }.padding()
            Button("Получить данные всех станций (allStations)") {
                allStations()
            }.padding()
            Button("Получить копирайты (copyrights)") {
                copyrights()
            }
        }
        .padding()
    }
    
    func confirm() {
        
    }
    
    
    /// Метод вывода расписания рейсов между двумя остановками
    private func scheduleBetweenStations() {
        Task {
            do {
                let schedule = try await service.getScheduleBetweenStations(from: "c146", to: "c213")
                print(schedule.self)
            } catch {
                print(error)
            }
        }
    }
    
    /// Метод вывода списка рейсов проходящих через остановку
    private func stationSchedule() {
        Task {
            do {
                let schedule = try await service.getStationSchedule(station: "s9600213")
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
                let stations = try await service.getRouteStations(uid: "028S_3_2")
                print(stations.title ?? "No stations data")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    /// Метод вывода ближайшей остановки
    private func nearestStations() {
        Task {
            let stations = try await service.getNearestStations(lat: 55.813902, lng: 37.597299, distance: 5)
            print(stations.stations ?? "No data")
        }
    }
    
    /// Метод вывода ближайшего города
    private func nearestCity() {
        Task {
            let settlements = try await service.getNearestCity(lat: 55.813902, lng: 37.597299)
            print(settlements.title ?? "No city data")
        }
    }
    
    /// Метод вывода информации о перевозчике
    private func carrierInfo() {
        Task {
            let carrierInfo = try await service.getCarrierInfo(code: "112")
            print(carrierInfo.carrier ?? "No carrier data")
        }
    }
    
    /// Метод вывода всех доступных остановок
    private func allStations() {
        Task {
            let stations = try await service.getAllStations()
            for countries in stations.countries! {
                print(countries.title ?? "No data")
            }
        }
    }
    
    /// Метод вывода копирайтов яндекса
    private func copyrights() {
        Task {
            let copyrights = try await service.getCopyright()
            print(copyrights.copyright ?? "No copyright data")
        }
    }
}
    

#Preview {
    DataNetworkService()
}

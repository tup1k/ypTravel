//
//  ContentView.swift
//  ypTravel
//
//  Created by Олег Кор on 09.01.2025.
//

import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    
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
            Button("Вывести ближайшие станции") {
                nearestStations()
            }.padding()
            Button("Вывести расписание рейсов между станциями") {
                scheduleBetweenStations()
            }.padding()
            Button("Вывести список рейсов у станции") {
                stationSchedule()
            }.padding()
            Button("Вывести список станций на маршруте") {
                routeStations()
            }.padding()
            Button("Вывести ближайший город") {
                nearestCity()
            }.padding()
            Button("Вывести данные о перевозчике на маршруте") {
                carrierInfo()
            }.padding()
            Button("Получить данные всех станций") {
                allStations()
            }.padding()
            Button("Получить копирайты") {
                copyrights()
                }
            }
        .padding()
    }
    
    func nearestStations() {
        Task {
            let stations = try await service.getNearestStations(lat: 55.813902, lng: 37.597299, distance: 5)
            print(stations.stations)
        }
    }
    
    func scheduleBetweenStations() {
        Task {
            let schedule = try await service.getScheduleBetweenStations(from: "s9600213", to: "s9600214")
            print(schedule.self)
        }
    }
    
    func stationSchedule() {
        Task {
            let schedule = try await service.getStationSchedule(station: "s9600213")
            print(schedule.schedule)
        }
    }
    
    func routeStations() {
        Task {
            let stations = try await service.getRouteStations(uid: "SU-1827A_c26_agent")
            print(stations.title ?? "No stations data")
        }
    }
    
    func nearestCity() {
        Task {
            let settlements = try await service.getNearestCity(lat: 55.813902, lng: 37.597299)
            print(settlements.title ?? "No city data")
        }
    }
    
    func carrierInfo() {
        Task {
            let carrierInfo = try await service.getCarrierInfo(code: "112")
            print(carrierInfo.carrier?.count ?? "No carrier data")
        }
    }
    
    func allStations() {
        Task {
            let stations = try await service.getAllStations()
            for contries in stations.countries! {
                print(contries.title)
            }
        }
    }
    
    func copyrights() {
        Task {
            let copyrights = try await service.getCopyright()
            print(copyrights.copyright ?? "No copyright data")
        }
    }
}

#Preview {
    ContentView()
}

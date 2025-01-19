//
//  ContentView.swift
//  ypTravel
//
//  Created by Олег Кор on 09.01.2025.
//

import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    
    private let client = Client(serverURL: try! Servers.Server1.url(), transport: URLSessionTransport())
    private let service: YPTravelNetworkService
    
    init () {
       service = YPTravelNetworkService(client: self.client, apikey: Constants.apiKey)
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button("Получить станции") {
             allStations()
                }
            }
        .padding()
    }
    
    
    func stations() {
        Task {
            let stations = try await service.getNearestStations(lat: 55.813902, lng: 37.597299, distance: 5)
        }
    }
//    
//    func settlemets() {
//        Task {
//            let settlements = try await service.getNearestSettlementInfo(lat: 55.813902, lng: 37.597299)
//            print(settlements.title)
//        }
//    }
    
        func allStations() {
            Task {
                let stations = try await service.getAllStations()
                for contries in stations.countries! {
                    print(contries.title)
                }
            }
        }
}

#Preview {
    ContentView()
}

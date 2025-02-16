//
//  StationSelectionView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct StationSelectionView: View {
    @EnvironmentObject var navigationArray: NavigationModel
    @State private var searchText: String = ""
    @Binding var selectedStation: String
    
    var selectedCity: String
    var selectedCityStations: [Station]
    var isFrom: Bool

    
    var body: some View {
        var stationArray: [Station] {
            if searchText.isEmpty {
                return selectedCityStations
            } else {
                return selectedCityStations.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            }
        }
        
        VStack {
            HStack {
                Button(action: {
                    navigationArray.pop()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.ypBlack)
                        .font(.system(size: 22))
                        .padding(.leading, 8)
                }
                Spacer()
                Text("Выбор станции")
                    .font(.headline)
                Spacer()
            }
            
            SearchBar(searchText: $searchText)
                .padding(.bottom)
            
            if stationArray.isEmpty {
                Spacer()
                Text("Станция не найдена")
                    .font(.system(size: 24, weight: .bold))
            } else {
                List(stationArray) { station in
                    Button {
                        selectedStation = "\(selectedCity) (\(station.name))"
                        navigationArray.popToRoot()
                    } label: {
                        HStack {
                            Text(station.name)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.ypBlack)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.inset)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    NavigationStack {
        StationSelectionView(selectedStation: .constant("123"), selectedCity: "Moscow", selectedCityStations: [Station(name: "123"), Station(name: "234")], isFrom: true)
            .environmentObject(NavigationModel())
    }
}

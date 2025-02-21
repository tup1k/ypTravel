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
    
    var stationArray: [Station] {
        if searchText.isEmpty {
            return selectedCityStations
        } else {
            return selectedCityStations.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button(action: {
                    navigationArray.pop()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.ypBlack)
                        .font(.system(size: 22, weight: .regular))
                }
                Spacer()
                Text("Выбор станции")
                    .font(.headline)
                    .padding(.bottom, 5)
                Spacer()
            }
            .padding(.horizontal, 10)
            
            SearchBar(searchText: $searchText)
            
            if stationArray.isEmpty, !searchText.isEmpty {
                Spacer()
                Text("Станция не найдена")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            } else {
                if stationArray.isEmpty {
                    ErrorView(errorType: ErrorViewModel.internetError)
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
                            .padding(.vertical, 10)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.ypWhite)
                    }
                    .listStyle(.plain)
                }
            }
        }
        .background(Color.ypWhite)
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    NavigationStack {
        StationSelectionView(selectedStation: .constant("123"), selectedCity: "Moscow", selectedCityStations: [Station(name: "123"), Station(name: "234")], isFrom: true)
            .environmentObject(NavigationModel())
    }
}

#Preview("InternetError") {
    NavigationStack {
        StationSelectionView(selectedStation: .constant(""), selectedCity: "", selectedCityStations: [], isFrom: true)
            .environmentObject(NavigationModel())
    }
}

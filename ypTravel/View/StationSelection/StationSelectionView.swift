//
//  StationSelectionView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct StationSelectionView: View {
    @StateObject private var viewModel: StationViewModel
    @EnvironmentObject var navigationArray: NavigationModel
    @Binding var selectedStation: Station
    var isFrom: Bool
    
    init(stations: [Station], selectedStation: Binding<Station>, isFrom: Bool) {
        _viewModel = StateObject(wrappedValue: StationViewModel(stations: stations))
        self._selectedStation = selectedStation
        self.isFrom = isFrom
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
            
            SearchBar(searchText: $viewModel.searchText)
            
            if viewModel.stationArray.isEmpty, !viewModel.searchText.isEmpty {
                Spacer()
                Text("Станция не найдена")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            } else {
                if viewModel.stationArray.isEmpty {
                    ErrorView(errorType: ErrorViewModel.internetError)
                } else {
                    List(viewModel.stationArray, id: \.self) { station in
                        Button {
                            selectedStation = station
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


//#Preview("InternetError") {
//    NavigationStack {
//        StationSelectionView(viewModel: <#StationViewModel#>, selectedStation: .constant(""), selectedCity: "", selectedCityStations: [], isFrom: true)
//            .environmentObject(NavigationModel())
//    }
//}

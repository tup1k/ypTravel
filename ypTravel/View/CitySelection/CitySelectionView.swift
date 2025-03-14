//
//  CitySelectionView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct CitySelectionView: View {
    @EnvironmentObject var navigationArray: NavigationModel
    @StateObject private var viewModel = CityViewModel()
    @Binding var selectedCity: City
    var isFrom: Bool
    
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
                    Text("Выбор города")
                        .font(.headline)
                        .padding(.bottom, 5)
                    Spacer()
                }
                .padding(.horizontal, 10)
                
            SearchBar(searchText: $viewModel.searchText)
            
            if viewModel.cityArray.isEmpty && !viewModel.searchText.isEmpty {
                Spacer()
                Text("Город не найден")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            } else {
                if viewModel.cityArray.isEmpty {
                    ErrorView(errorType: ErrorViewModel.serverError)
                } else {
                    List(viewModel.cityArray) { city in
                        Button {
                            selectedCity = city
                            navigationArray.push(.stationView(city.stations, isFrom))
                        } label: {
                            HStack {
                                Text(city.name)
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
        CitySelectionView(selectedCity: .constant(City(name: "Moscow", stations: [Station(name: "Курский вокзал", code: "")])), isFrom: true)
            .environmentObject(NavigationModel())
            .background(.ypWhite)
    }
}

//#Preview("ServerError") {
//    let viewModel = CityViewModel()
//    viewModel.cities = []
//    
//    CitySelectionView(selectedCity: .constant(City(name: "Москва", stations: [])), isFrom: true)
//            .environmentObject(NavigationModel())
//            .environmentObject(viewModel)
//    
//}

//
//  CitySelectionView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct CitySelectionView: View {
    @EnvironmentObject var navigationArray: NavigationModel
    @StateObject var viewModel = CityViewModel()
    @State private var searchText: String = ""

    var isFrom: Bool
    
    var cityArray: [City] {
        if searchText.isEmpty {
            return viewModel.cities
        } else {
            return viewModel.cities.filter { $0.name.lowercased().contains(searchText.lowercased()) }
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
                    Text("Выбор города")
                        .font(.headline)
                        .padding(.bottom, 5)
                    Spacer()
                }
                .padding(.horizontal, 10)
                
                SearchBar(searchText: $searchText)
            
            if cityArray.isEmpty && !searchText.isEmpty {
                Spacer()
                Text("Город не найден")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            } else {
                if cityArray.isEmpty {
                    ErrorView(errorType: ErrorViewModel.serverError)
                } else {
                    List(cityArray) { city in
                        Button {
                            navigationArray.push(.stationView(city.name, city.stations, isFrom))
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
        CitySelectionView(isFrom: true)
            .environmentObject(NavigationModel())
            .background(.ypWhite)
    }
}

#Preview("ServerError") {
    let viewModel = CityViewModel()
    viewModel.cities = []
    
    return CitySelectionView(viewModel: viewModel, isFrom: true)
            .environmentObject(NavigationModel())
            .environmentObject(viewModel)
    
}

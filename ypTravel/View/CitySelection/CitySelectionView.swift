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
    @Binding var selectedCity: Station
//    @State private var searchText: String = ""
    var isFrom: Bool
    
//    private var cityArray: [City] {
//        let filteresCities = searchText.isEmpty ? viewModel.cities : viewModel.cities.filter { city in
//            let cityTitleString = city.name
//            let cityTitle = cityTitleString.lowercased()
//            return cityTitle.contains(searchText.lowercased())
//        }
//        return filteresCities.sorted {($0.name).localizedCaseInsensitiveCompare($1.name) == .orderedAscending  }
//    }
    
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
                    List(viewModel.cityArray, id: \.self) { city in
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
        CitySelectionView(selectedCity: .constant(Station(name: "Курский вокзал", code: "")), isFrom: true)
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

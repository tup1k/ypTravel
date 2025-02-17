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
                Text("Выбор города")
                    .font(.headline)
                Spacer()
            }
            
            SearchBar(searchText: $searchText)
                .padding(.bottom)
            
            if cityArray.isEmpty {
                if cityArray.isEmpty && viewModel.cities.isEmpty {
                    ServerErrorView()
                } else {
                    VStack {
                        Spacer()
                        Text("Город не найден")
                            .font(.system(size: 24, weight: .bold))
                        Spacer()
                    }
                }
            } else {
                
                List(cityArray) { city in
                    Button {
                        navigationArray.push(.stationView(city.name, city.stations, isFrom))
                    } label: {
                        HStack {
                            Text(city.name)
                                .padding(.bottom)
                                .font(.system(size: 17))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.ypBlack)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.inset)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        CitySelectionView(isFrom: true)
            .environmentObject(NavigationModel())
    }
}

#Preview("ServerError") {
    let viewModel = CityViewModel()
    viewModel.cities = []
    
    return CitySelectionView(viewModel: viewModel , isFrom: true)
            .environmentObject(NavigationModel())
            .environmentObject(viewModel)
    
}

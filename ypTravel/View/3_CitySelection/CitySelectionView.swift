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
//    @Binding var selectedCity: String
    var isFrom:Bool
    
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
            
            if cityArray.isEmpty {
                Text("Город не найден")
                    .font(.system(size: 24, weight: .bold))
            } else {
                List(cityArray) { city in
                    Button {
//                        selectedCity = "\(city.name)"
//                        navigationArray.push(.stationView)
                    } label: {
                        HStack {
                            Text(city.name)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.ypBlack)
                        }
                    }
                    .listRowSeparator(.hidden)
                    
//                    NavigationLink(city.name, value: city)
//                        .listRowSeparator(.hidden)
                }
                .font(.system(size: 17))
                .listStyle(.inset)
                .navigationBarBackButtonHidden(true)
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        CitySelectionView(isFrom: true)
            .environmentObject(NavigationModel())
    }
}

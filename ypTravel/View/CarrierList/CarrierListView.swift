//
//  CarrierListView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct CarrierListView: View {
    @StateObject private var viewModel = RouteCarrierViewModel()
    @Environment(\.dismiss) private var dismiss
    var fromPlace: Station
    var toPlace: Station
    
    @State private var showFilter: Bool = false
    @State private var isFiltered: Bool = false
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            Color.ypWhite
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.primary)
                            .padding(.leading, 8)
                    }
                    Spacer()
                }
                .padding(.leading, 8)
                .padding(.vertical, 10)
                
                Text("\(fromPlace.name) → \(toPlace.name)")
                    .frame(alignment: .leading)
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .padding(.horizontal, 16)
                    .lineLimit(nil)
                    
                if viewModel.isLoading {
                    Spacer()
                    LoadingPlaceholder() 
                    Spacer()
                } else if viewModel.carrierArray.isEmpty {
                    Spacer()
                    Text("Вариантов нет")
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                } else {
                    ScrollView (showsIndicators: false) {
                        LazyVGrid(columns: columns) {
                            ForEach(viewModel.carrierArray) { routeCarrierInfo in
                                NavigationLink(destination: CarrierInfoView(routeCarrierInfo: routeCarrierInfo)) {
                                    CarrierListCell(routeCarrierInfo: routeCarrierInfo)
                                }
                            }
                        }
                    }
                }
                
            }
            .background(.ypWhite)
            
            VStack {
                Spacer()
                Button(action: {
                    showFilter = true
                    self.isFiltered = isFiltered 
                }) {
                    HStack {
                        Text("Уточнить время")
                        Circle()
                            .fill(isFiltered ? .ypRed : .ypBlue)
                            .frame(width: 8, height: 8)
                    }
                }
                .font(.system(size: 17, weight: .bold, design: .default))
                .frame(width: 343, height: 60)
                .padding(.horizontal, 16)
                .foregroundColor(.ypWhiteUniversal)
                .background(Color.ypBlue)
                .cornerRadius(16)
                .navigationDestination(isPresented: $showFilter) {
                    RouteTimeSelectionView(filterViewModel: viewModel, isFiltered: $isFiltered)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            Task {
                try await viewModel.loadRoutes(codeOutput: fromPlace.code, codeInput: toPlace.code)
            }
        }
    }
}

#Preview {
    NavigationStack {
        CarrierListView(fromPlace: Station(name: "Москва (Курский вокзал)", code: ""), toPlace: Station(name: "Курск", code: ""))
    }
}


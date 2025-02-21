//
//  CarrierListView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct CarrierListView: View {
    @StateObject private var viewModel = RouteCarrierListViewModel()
    @Environment(\.dismiss) private var dismiss
    @Binding var fromPlace: String
    @Binding var toPlace: String
    @State private var showFilter: Bool = false
    @State private var isFiltered: Bool = false
    @State private var isShowWithTransfers: Bool?
    let columns = [GridItem(.flexible())]
    
    var carrierArray: [RouteCarrierStruct] {
        if isShowWithTransfers ?? true == true {
            return viewModel.carrierList
        } else {
            return viewModel.carrierList.filter { $0.transferInfo.isEmpty }
        }
    }
    
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
                
                Text("\(fromPlace) → \(toPlace)")
                    .frame(alignment: .leading)
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .padding(.horizontal, 16)
                    .lineLimit(nil)
                
                if carrierArray.isEmpty {
                    Spacer()
                    Text("Вариантов нет")
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                } else {
                    ScrollView (showsIndicators: false) {
                        LazyVGrid(columns: columns) {
                            ForEach(carrierArray) { routeCarrierInfo in
                                NavigationLink(destination: CarrierInfoView()) {
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
                    RouteTimeSelectionView(isShowWithTransfers: Binding(projectedValue: $isShowWithTransfers), isFiltered: $isFiltered)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        CarrierListView(fromPlace: .constant("Москва (Ярославский вокзал)"), toPlace: .constant("Санкт Петербург (Балтийский вокзал)"))
    }
}


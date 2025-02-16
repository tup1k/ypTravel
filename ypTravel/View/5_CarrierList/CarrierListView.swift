//
//  CarrierListView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct CarrierListView: View {
    @StateObject var viewModel = RouteCarrierListViewModel()
    @Environment(\.dismiss) private var dismiss
    var from: String
    var to: String
    @State var showFilter: Bool = false
    @State var isFiltered: Bool
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.primary)
                    }
                    Spacer()
                }
                .padding(.leading, 8)
                .padding(.vertical, 10)
                
                Text("\(from) → \(to)")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .padding(.horizontal, 16)
                    .lineLimit(nil)
                ScrollView (.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.carrierList) { routeCarrierInfo in
                            NavigationLink(destination: CarrierInfoView()) {
                                    CarrierListCell(routeCarrierInfo: routeCarrierInfo)
                                }
                        }
                    }
                }
            }
            
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
                .foregroundColor(.ypWhite)
                .background(Color.ypBlue)
                .cornerRadius(16)
                .navigationDestination(isPresented: $showFilter) {
                    RouteTimeSelectionView(isFiltered: $isFiltered)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        CarrierListView(from: "Москва (Ярославский вокзал)", to: "Санкт Петербург (Балтийский вокзал)", isFiltered: false)
    }
}

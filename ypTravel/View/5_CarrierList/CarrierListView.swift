//
//  CarrierListView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct CarrierListView: View {
    @StateObject var viewModel = RouteCarrierListViewModel()
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            VStack {
                Text("Москва (Ярославский вокзал) → Санкт Петербург (Балтийский вокзал)")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .padding(.horizontal, 16)
                ScrollView (.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.carrierList, id: \.self) { routeCarrierInfo in
                                CarrierListCell(routeCarrierInfo: routeCarrierInfo)
                        }
                    }
                }
            }
            
            VStack {
                Spacer()
                
                Button(action: {
                }) {
                    Text("Уточнить время")
                }
                .frame(alignment: .bottom)
                .padding(.horizontal, 16)
                .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: 60)
                .buttonStyle(.bordered)
                .font(.system(size: 17, weight: .bold, design: .default))
                .foregroundColor(.ypWhite)
                .background(Color.ypBlue)
                .cornerRadius(16)
            }
        }
        
        
    }
}

#Preview {
    CarrierListView()
}

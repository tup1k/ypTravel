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
        ScrollView (.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.carrierList, id: \.self) { routeCarrierInfo in
                    CarrierListCell(routeCarrierInfo: routeCarrierInfo)
                }
            }
        }
    }
}

#Preview {
    CarrierListView()
}

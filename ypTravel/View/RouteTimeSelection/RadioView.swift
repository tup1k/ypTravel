//
//  RadioView.swift
//  ypTravel
//
//  Created by Олег Кор on 14.03.2025.
//

import SwiftUI

struct RadioView: View {
    @ObservedObject private var filterViewModel: RouteCarrierViewModel
    private var radioText: String
    private var isShowWithTransfers: Bool
    
    init(filterViewModel: RouteCarrierViewModel, radioText: String, isShowWithTransfers: Bool) {
        self.filterViewModel = filterViewModel
        self.radioText = radioText
        self.isShowWithTransfers = isShowWithTransfers
    }

    var body: some View {
        HStack {
            Text(radioText)
            Spacer()
            Image(systemName: filterViewModel.isShowWithTransfers == isShowWithTransfers ? "largecircle.fill.circle" : "circle")
                .onTapGesture {
                    filterViewModel.isShowWithTransfers = isShowWithTransfers
                }
        }
        .padding()
    }
}

struct Radio_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RouteCarrierViewModel()
        return RadioView(filterViewModel: viewModel, radioText: "Да", isShowWithTransfers: true)
    }
}

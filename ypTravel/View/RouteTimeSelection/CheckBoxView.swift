//
//  CheckBoxView.swift
//  ypTravel
//
//  Created by Олег Кор on 16.02.2025.
//

import SwiftUI

struct CheckBoxView: View {
    @ObservedObject private var filterViewModel: RouteCarrierViewModel
    @State private var checked: Bool
    private var filterText: String
    
    init(filterViewModel: RouteCarrierViewModel, filterText: String) {
        self.filterViewModel = filterViewModel
        self.filterText = filterText
        _checked = State(initialValue: filterViewModel.filterArray.contains(filterText))
    }
    
    var body: some View {
        HStack {
            Text(filterText)
                .font(.system(size: 17))
            Spacer()
            Image(systemName: checked ? "checkmark.square.fill" : "square") // исправлено
                .onTapGesture {
                    checked.toggle()
                    if checked {
                        filterViewModel.filterArray.append(filterText)
                    } else {
                        if let index = filterViewModel.filterArray.firstIndex(of: filterText) {
                            filterViewModel.filterArray.remove(at: index)
                        }
                    }
                }
        }
        .padding()
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RouteCarrierViewModel()
        return CheckBoxView(filterViewModel: viewModel, filterText: "Утро 06:00 - 12:00")
    }
}

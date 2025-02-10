//
//  StationSelectionView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct StationSelectionView: View {
    @StateObject var viewModel = CityViewModel()
    @State var selectedCity: String?
    @State var selectedCityStations: [Station]
    
    var body: some View {
        List {
            ForEach(selectedCityStations) { station in
                Text(station.name)
                    
                }
            }
        }
    }


#Preview {
    StationSelectionView(viewModel: CityViewModel(), selectedCity: "Moscow", selectedCityStations: [Station(name: "123")])
}

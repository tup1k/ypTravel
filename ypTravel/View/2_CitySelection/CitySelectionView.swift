//
//  CitySelectionView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct CitySelectionView: View {
    @StateObject var viewModel = CityViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.cities) { city in
                NavigationLink(city.name, value: city)
            }
            .font(.system(size: 17))
            .navigationDestination(for: City.self) { city in
                CityDetails(city: city)
            }
        }
    }
}

#Preview {
    CitySelectionView()
}

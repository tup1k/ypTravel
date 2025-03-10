//
//  FromToButton.swift
//  ypTravel
//
//  Created by Олег Кор on 15.02.2025.
//

import SwiftUI

struct FromToButton: View {
    let buttonPlaceholder: String
    let cityName: String
    let stationName: String
    let isUp: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(stationName.isEmpty ? buttonPlaceholder : "\(cityName) (\(stationName)")
                .foregroundColor(stationName.isEmpty ? .ypGray : .ypBlackUniversal)
                .font(.system(size: 17, weight: .regular))
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 48)
                .lineLimit(1)
                .truncationMode(.tail)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 16)
        }
    }
}

#Preview {
    FromToButton(buttonPlaceholder: "Откуда", cityName: "", stationName: "", isUp: true) {}
}

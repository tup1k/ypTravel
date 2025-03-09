//
//  FromToButton.swift
//  ypTravel
//
//  Created by Олег Кор on 15.02.2025.
//

import SwiftUI

struct FromToButton: View {
    @Binding var fromTo: Station
    let buttonPlaceholder: String
    let isUp: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(fromTo.name.isEmpty ? buttonPlaceholder : fromTo.name)
                .foregroundColor(fromTo.name.isEmpty ? .ypGray : .ypBlackUniversal)
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
    FromToButton(fromTo: .constant(Station(name: "", code: "")), buttonPlaceholder: "Откуда", isUp: true) {}
}

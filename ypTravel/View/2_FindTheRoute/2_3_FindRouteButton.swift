//
//  FindButton.swift
//  ypTravel
//
//  Created by Олег Кор on 15.02.2025.
//
import SwiftUI

struct FindRouteButton: View {
    let isActive: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Найти")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.ypWhite)
                .frame(maxWidth: 150, maxHeight: 60)
        }
        .buttonStyle(.bordered)
        .background(Color.ypBlue)
        .frame(maxWidth: 150, maxHeight: 60)
        .cornerRadius(16)
//        .disabled(!isActive)
//        .opacity(isActive ? 1 : 0)
    }
}

#Preview {
    FindRouteButton(isActive: true) { }
        
}

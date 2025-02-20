//
//  CloseButton.swift
//  ypTravel
//
//  Created by Олег Кор on 20.02.2025.
//

import SwiftUI

struct CloseButton: View {
    let action: () -> Void
    
    var body: some View {
        Button("", systemImage: "close.circle") {
            action()
        }
    }
}

#Preview {
    CloseButton(action: {})
}

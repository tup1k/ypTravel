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
        Button(action: {
           action()
        }) {
           Image("StoriesCloseButton")
                .resizable()
                .scaledToFit().frame(width: 30, height: 30)
        }
    }
}

#Preview {
    CloseButton(action: {})
}

//
//  MaskView.swift
//  ypTravel
//
//  Created by Олег Кор on 24.02.2025.
//

import SwiftUI

struct MaskView: View {
    let numberOfSection: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfSection, id: \.self) { _ in
                MaskFragmentView()
            }
        }
    }
}

#Preview {
    Color.purple
        .ignoresSafeArea()
        .overlay(
            MaskView(numberOfSection: 5)
                .padding()
        )
}

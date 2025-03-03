//
//  ProgressBar.swift
//  ypTravel
//
//  Created by Олег Кор on 23.02.2025.
//

import SwiftUI

struct MaskFragmentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fixedSize(horizontal: false, vertical: true)
            .frame(height: 6)
            .foregroundStyle(.ypWhiteUniversal)
    }
}

#Preview {
    Color.purple
        .ignoresSafeArea()
        .overlay(
            MaskFragmentView()
        )
}

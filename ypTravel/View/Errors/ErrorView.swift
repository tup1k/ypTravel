//
//  InternetErrorView.swift
//  ypTravel
//
//  Created by Олег Кор on 12.02.2025.
//

import SwiftUI

struct ErrorView: View {
    private var errorType: ErrorViewModel
    
    init(errorType: ErrorViewModel) {
        self.errorType = errorType
    }
    
    var body: some View {
        VStack {
            Spacer()
            Image(errorType.type.errorImage)
            Text(errorType.type.errorText)
                .font(.system(size: 24, weight: .bold))
            Spacer()
        }
        .background(.ypWhite)
    }
}

#Preview {
    ErrorView(errorType: ErrorViewModel.internetError)
}

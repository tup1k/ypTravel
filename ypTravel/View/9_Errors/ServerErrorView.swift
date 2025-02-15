//
//  ServerErrorView.swift
//  ypTravel
//
//  Created by Олег Кор on 12.02.2025.
//

import SwiftUI

struct ServerErrorView: View {
    var body: some View {
        VStack {
            Image("ServerErrorImage")
            Text("Ошибка сервера")
                .font(.system(size: 24, weight: .bold))
        }
    }
}

#Preview {
    ServerErrorView()
}

//
//  InternetErrorView.swift
//  ypTravel
//
//  Created by Олег Кор on 12.02.2025.
//

import SwiftUI

struct InternetErrorView: View {
    var body: some View {
        VStack {
            Image("InternerErrorImage")
            Text("Нет интернета")
                .font(.system(size: 24, weight: .bold))
        }
    }
}

#Preview {
    InternetErrorView()
}

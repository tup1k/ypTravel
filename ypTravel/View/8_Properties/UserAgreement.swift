//
//  UserAgreement.swift
//  ypTravel
//
//  Created by Олег Кор on 08.02.2025.
//

import SwiftUI

struct UserAgreement: View {
    
    @Binding var tabBarIsHidden: Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
                tabBarIsHidden = false
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.ypBlack)
                    .font(.system(size: 22))
                    .padding(.leading, 8)
            }
            Spacer()
            Text("Пользовательское соглашение")
                .font(.headline)
            Spacer()
        }
        
        NavigationView {
            WebView(url: URL(string: "https://yandex.ru/legal/practicum_offer")!)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    UserAgreement(tabBarIsHidden: .constant(true))
}

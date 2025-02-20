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
    @Environment(\.colorScheme) var colorScheme
    @State private var isDarkMode = false
    
    var body: some View {
        VStack {
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
                WebView(isDarkMode: $isDarkMode)
                    .edgesIgnoringSafeArea(.all)
                    .background(.ypWhite)
            }
            .onAppear {
                isDarkMode = colorScheme == .dark
            }
            .onChange(of: colorScheme) { newScheme in
                isDarkMode = newScheme == .dark
            }
            .navigationBarBackButtonHidden(true)
        }
        .background(.ypWhite)
    }
}

#Preview {
    UserAgreement(tabBarIsHidden: .constant(true))
}

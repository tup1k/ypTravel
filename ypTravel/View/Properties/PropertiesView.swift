//
//  PropertiesView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct PropertiesView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @Binding var tabBarIsHidden: Bool
    @State private var showUserAgreement: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Toggle("Темная тема", isOn: $isDarkMode)
                .padding(16)
                
                Button {
                    tabBarIsHidden = true
                    showUserAgreement = true
                } label: {
                    HStack {
                        Text("Пользовательское соглашение")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding(16)
                    .foregroundColor(isDarkMode ? .white : .black)
                }
                .navigationDestination(isPresented: $showUserAgreement){
                    UserAgreement(tabBarIsHidden: $tabBarIsHidden)
                }
                
                Spacer()
                
                VStack {
                    Text("Приложение использует API «Яндекс.Расписания»")
                        .font(.system(size: 12, weight: .regular, design: .default))
                        .padding()
                    Text("Версия 1.0 (beta)")
                        .font(.system(size: 12, weight: .regular, design: .default))
                }
                .padding(.leading, 16)
                .padding(.top, 24)
                .padding(.trailing, 16)
                
            }
            .foregroundColor(.ypBlack)
            .background(.ypWhite)
            
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
    
}

#Preview {
    PropertiesView(tabBarIsHidden: .constant(false))
}

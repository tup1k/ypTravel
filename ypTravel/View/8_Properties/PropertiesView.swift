//
//  PropertiesView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct PropertiesView: View {
//    @State private var isDarkMode = false
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some View {
        NavigationView {
                VStack(alignment: .leading) {
                    Toggle(isOn: $isDarkMode) {
                        Text("Темная тема")
                            .font(.system(size: 17, weight: .regular, design: .default))
                    }
                    .toggleStyle(.switch)
                    .padding(.bottom, 38)
                    
                    NavigationLink(destination: UserAgreement()) {
                        HStack {
                            Text("Пользовательское соглашение")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .font(.system(size: 17, weight: .regular, design: .default))
                    }
                    .foregroundColor(.ypBlack)
                    
                    Spacer()
                }
                .padding(.leading, 16)
                .padding(.top, 24)
                .padding(.trailing, 16)
            .preferredColorScheme(isDarkMode ? .dark : .light)
            }
        
    }
    
}

#Preview {
    PropertiesView()
}

//
//  PropertiesView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct PropertiesView: View {
    @State private var darkModeIsOn = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $darkModeIsOn) {
                Text("Темная тема")
            }
            .toggleStyle(.switch)
            
            List {
                Text("Пользовательское соглащение")
            }
        }
       
    }
}

#Preview {
    PropertiesView()
}

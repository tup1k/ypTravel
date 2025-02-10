//
//  ypTravelApp.swift
//  ypTravel
//
//  Created by Олег Кор on 09.01.2025.
//

import SwiftUI

@main
struct ypTravelApp: App {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some Scene {
        WindowGroup {
                ContentView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}


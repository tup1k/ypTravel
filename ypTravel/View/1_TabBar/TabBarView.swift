//
//  TabBarView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var tabBarIsHidden = false
    @State private var tagIndex = 0
    
    var body: some View {
        
        TabView {
                    FindTheRouteView(tabBarIsHidden: $tabBarIsHidden)
                        .tabItem {
                            Image("TabBarOne")
                                .renderingMode(.template)
                        }
                        .toolbar(tabBarIsHidden ? .hidden : .visible, for: .tabBar)
                    PropertiesView(tabBarIsHidden: $tabBarIsHidden)
                        .tabItem {
                            Image("TabBarSecond")
                                .renderingMode(.template)
                        }
                        .toolbar(tabBarIsHidden ? .hidden : .visible, for: .tabBar)
        }
        .accentColor(.ypBlack)
    }
}

#Preview {
    TabBarView()
}

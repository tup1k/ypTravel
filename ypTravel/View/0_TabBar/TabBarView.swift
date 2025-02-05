//
//  TabBarView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
       
                TabView {
                    FindTheRouteView()
                    .tabItem {
                        Label("", image: "TabBarOne")
                    }
                    PropertiesView()
                    .tabItem {
                        Label("", image: "TabBarSecond")
                    }
                }
        
        
    }
}

#Preview {
    TabBarView()
}

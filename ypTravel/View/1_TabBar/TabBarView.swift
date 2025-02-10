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
                        Image("TabBarOne")
                            .renderingMode(.template)
                    }
                    PropertiesView()
                    .tabItem {
                        Image("TabBarSecond")
                            .renderingMode(.template)
                    }
                }
                .accentColor(.ypBlack)
        
        
    }
}

#Preview {
    TabBarView()
}

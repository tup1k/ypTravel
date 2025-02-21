//
//  SplashScreen.swift
//  ypTravel
//
//  Created by Олег Кор on 20.02.2025.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive: Bool = false
    
    var body: some View {
        if isActive {
            TabBarView()
        } else {
            Image("LaunchScreen")
                .resizable()
                .ignoresSafeArea(.all)
                .scaledToFill()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.isActive = true
                        }
                    }
                }
        }
    }
}

#Preview {
    SplashScreen()
}

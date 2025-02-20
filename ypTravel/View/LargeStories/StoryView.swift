//
//  StoryView.swift
//  ypTravel
//
//  Created by Олег Кор on 20.02.2025.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Text("🎉 ⭐️ ❤️")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                Text("Some text")
                    .font(.system(size: 20, weight: .regular))
                    .lineLimit(3)
                    .foregroundColor(.white)
            }
            .padding(.init(top: 0, leading: 16, bottom: 40, trailing: 16))
        }
    }
}

#Preview {
    Color.story1Background
        .ignoresSafeArea()
        .overlay {
            StoryView()
        }
}

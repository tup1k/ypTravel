//
//  StoriesCellView2.swift
//  ypTravel
//
//  Created by Олег Кор on 22.02.2025.
//

import SwiftUI

struct StoriesCellView: View {
    var imageHeight: Double = 140
    var imageWidth: Double = 92
    var story: Story
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack(alignment: .leading) {
                Image(story.image)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 4).foregroundColor(.ypBlue))
                Text(story.text)
                    .foregroundStyle(.ypWhiteUniversal)
                    .font(.system(size: 12))
                    .multilineTextAlignment(.leading)
                    .frame(width: 76, alignment: .leading)
                    .padding(.top, 83)
                    .clipped()
            }
        }
    }
}

#Preview {
    StoriesCellView(story: Story(image: "MokStorie_1", text: "Text text text text text text text text text text text text text", isViewed: false, largeStory: [LargeStory(largeImage: "MokStorie_1_1", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text") ]), action: {})
}

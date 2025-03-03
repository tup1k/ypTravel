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
    let storyImage: String
    let storyText: String
    let isViewed: Bool
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
                Image(storyImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: imageHeight)
                Text(storyText)
                    .foregroundStyle(.ypWhiteUniversal)
                    .font(.system(size: 12))
                    .lineLimit(3)
                    .padding(.init(top: 0, leading: 8, bottom: 12, trailing: 8))
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: imageWidth, maxHeight: imageHeight)
            .background()
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .opacity(isViewed ? 0.5 : 1)
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 4).foregroundColor(isViewed ? .clear : .ypBlue))
    }
}

#Preview {
    StoriesCellView(storyImage: "MokStorie_1", storyText: "Text text text text text text text text text text text text text", isViewed: false)
}

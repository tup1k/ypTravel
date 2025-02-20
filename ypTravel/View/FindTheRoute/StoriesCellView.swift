//
//  StoriesCellView.swift
//  ypTravel
//
//  Created by Олег Кор on 03.02.2025.
//

import SwiftUI

struct StoriesCellView: View {
    var imageHeight: Double = 140
    var imageWidth: Double = 92
    var story: Story
    
    var body: some View {
        ZStack {
            Image(story.imageName)
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

#Preview {
    StoriesCellView(story: Story(imageName: "MokStorie_1", text: "Text text text text text text text text text text text text text"))
}

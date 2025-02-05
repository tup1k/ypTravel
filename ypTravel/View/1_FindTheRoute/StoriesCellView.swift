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
            Text("Text")
                .foregroundStyle(.ypWhiteUniversal)
                .scaledToFit()
                .multilineTextAlignment(.leading)
            
                
                
        }
    }
}

#Preview {
    StoriesCellView(story: Story(imageName: "MokStorie_1"))
}

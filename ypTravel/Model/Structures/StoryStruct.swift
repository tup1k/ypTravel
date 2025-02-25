//
//  Stories.swift
//  ypTravel
//
//  Created by Олег Кор on 04.02.2025.
//

import Foundation

struct Story: Hashable, Identifiable {
    let id = UUID()
    let image: String
    let text: String
    var isViewed: Bool
    let largeStory: [LargeStory]
}

struct LargeStory: Hashable, Identifiable {
    let id = UUID()
    let largeImage: String
    let title: String
    let description: String
}


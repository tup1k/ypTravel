//
//  StoriesViewModel.swift
//  ypTravel
//
//  Created by Олег Кор on 04.02.2025.
//
import Foundation

final class StoriesViewModel: ObservableObject {
    @Published var stories: [Story] = []
    
    init() {
        let largeStory_1_1 = LargeStory(largeImage: "MokStorie_1_1", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_1_2 = LargeStory(largeImage: "MokStorie_1_2", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_2_1 = LargeStory(largeImage: "MokStorie_2_1", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_2_2 = LargeStory(largeImage: "MokStorie_2_2", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_3_1 = LargeStory(largeImage: "MokStorie_3_1", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_3_2 = LargeStory(largeImage: "MokStorie_3_2", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_4_1 = LargeStory(largeImage: "MokStorie_4_1", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_4_2 = LargeStory(largeImage: "MokStorie_4_2", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_5_1 = LargeStory(largeImage: "MokStorie_5_1", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_5_2 = LargeStory(largeImage: "MokStorie_5_2", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_6_1 = LargeStory(largeImage: "MokStorie_6_1", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_6_2 = LargeStory(largeImage: "MokStorie_6_2", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_7_1 = LargeStory(largeImage: "MokStorie_7_1", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_7_2 = LargeStory(largeImage: "MokStorie_7_2", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_8_1 = LargeStory(largeImage: "MokStorie_8_1", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_8_2 = LargeStory(largeImage: "MokStorie_8_2", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_9_1 = LargeStory(largeImage: "MokStorie_9_1", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        let largeStory_9_2 = LargeStory(largeImage: "MokStorie_9_2", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
        
        
        
        
        
        let story_1 = Story(image: "MokStorie_1", text: "Text text text text text text text", isViewed: false, largeStory: [largeStory_1_1, largeStory_1_2])
        let story_2 = Story(image: "MokStorie_2", text: "Text text text text text text text", isViewed: false, largeStory: [largeStory_2_1, largeStory_2_2])
        let story_3 = Story(image: "MokStorie_3", text: "Text text text text text text text", isViewed: false, largeStory: [largeStory_3_1, largeStory_3_2])
        let story_4 = Story(image: "MokStorie_4", text: "Text text text text text text text", isViewed: false, largeStory: [largeStory_4_1, largeStory_4_2])
        let story_5 = Story(image: "MokStorie_5", text: "Text text text text text text text", isViewed: false, largeStory: [largeStory_5_1, largeStory_5_2])
        let story_6 = Story(image: "MokStorie_6", text: "Text text text text text text text", isViewed: false, largeStory: [largeStory_6_1, largeStory_6_2])
        let story_7 = Story(image: "MokStorie_7", text: "Text text text text text text text", isViewed: false, largeStory: [largeStory_7_1, largeStory_7_2])
        let story_8 = Story(image: "MokStorie_8", text: "Text text text text text text text", isViewed: false, largeStory: [largeStory_8_1, largeStory_8_2])
        let story_9 = Story(image: "MokStorie_9", text: "Text text text text text text text", isViewed: false, largeStory: [largeStory_9_1, largeStory_9_2])
        
        self.stories = [story_1, story_2, story_3, story_4, story_5, story_6, story_7, story_8, story_9]
    }
}


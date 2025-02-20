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
        let story_1 = Story(imageName: "MokStorie_1", text: "Text text text text text text text")
        let story_2 = Story(imageName: "MokStorie_2", text: "Text text text text text text text")
        let story_3 = Story(imageName: "MokStorie_3", text: "Text text text text text text text")
        let story_4 = Story(imageName: "MokStorie_4", text: "Text text text text text text text")
        
        self.stories = [story_1, story_2, story_3, story_4]
    }
}


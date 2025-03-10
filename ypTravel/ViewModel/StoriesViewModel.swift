import SwiftUI

final class StoriesViewModel: ObservableObject {
    @Published var stories: [Story] = []
    @Published var selectedStory: Story
    @Published var selectedLargeStory: Int
    
    init(
        stories: [Story] = StoriesMokData.shared.stories,
        selectedStory: Story = Story(image: "MokStorie_2", text: "", isViewed: false, largeStory: []),
        selectedLargeStory: Int = 0
    ) {
        self.stories = stories
        self.selectedStory = selectedStory
        self.selectedLargeStory = selectedLargeStory
    }
    
   var isStoryViewed: Binding<Bool> {
        Binding<Bool> (
            get: { [self] in
                let storyIndex = stories.firstIndex(where: { selectedStory == $0 })
                return stories[storyIndex ?? 0].isViewed
            },
            set: { [self] in
                let storyIndex = stories.firstIndex(where: { selectedStory == $0 })
                stories[storyIndex ?? 0].isViewed = $0
            }
        )
    }
    
    
    func selectStory(story: Story) {
        if let index = stories.firstIndex(of: story) {
            selectedStory = story
            selectedLargeStory = index
        }
    }
    
}


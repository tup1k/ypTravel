//
//  LargeStoriesView.swift
//  ypTravel
//
//  Created by Олег Кор on 22.02.2025.
//

import SwiftUI
import Combine

struct LargeStoriesView: View {
    @StateObject private var viewModel = StoriesViewModel()
    @State private var storyIndex: Int
    @State private var progress: CGFloat = 0
    @State private var timer: Timer.TimerPublisher = Timer.publish(every: 5, on: .main, in: .common)
    @State private var cancellable: Cancellable?
    @Binding var goToStories: Bool
    @Binding var isViewed: Bool
    
    let stories: [Story]
    private let configuration: ProgressBarConfiguration
    private var currentLargeStory: LargeStory { stories[storyIndex].largeStory[currentLargeStoryIndex] }
    private var currentLargeStoryIndex: Int { Int(progress * CGFloat(stories[storyIndex].largeStory.count)) }
    
    init(stories: [Story], storyIndex: Int, isViewed: Binding<Bool>, goToStories: Binding<Bool>) {
        self.stories = stories
        self.storyIndex = storyIndex
        self.configuration = ProgressBarConfiguration(storiesCount: stories[storyIndex].largeStory.count)
        self.timer = Self.createTimer(configuration: configuration)
        self._goToStories = goToStories
        self._isViewed = isViewed
        print("StoryIndex в инициализаторе: \(storyIndex)")
       }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoryView(story: currentLargeStory)
                .onAppear {
                    print(currentLargeStory)
                }
            ProgressBar(numberOfSections: stories[storyIndex].largeStory.count, progress: progress)
                .padding(.init(top: 28, leading: 12, bottom: 12, trailing: 12))
            CloseButton(action: {goToStories = false; isViewed = true})
                .padding(.top, 57)
                .padding(.trailing, 12)
        }
        .onAppear {
            timer = Self.createTimer(configuration: configuration)
            cancellable = timer.connect()
        }
        .onDisappear {
            cancellable?.cancel()
        }
        .onReceive(timer) { _ in
            timerTick()
        }
        .onTapGesture { size in
            size.x < UIScreen.main.bounds.width / 2 ? previousStory() : nextStory()
            resetTimer()
        }
        .gesture(DragGesture()
            .onEnded { size in
                if size.translation.width < -50 {
                    nextStory()
                    resetTimer()
                } else if size.translation.width > 50 {
                    previousStory()
                    resetTimer()
                } else if size.translation.height > 50 {
                    goToStories = false
                }
            }
        )
        .presentationDetents([.medium, .large])
    }
    
    private func timerTick() {
        var nextProgress = progress + configuration.progressPerTick
        if nextProgress >= 1 {
            closeStory()
            nextProgress = 0
        }
        withAnimation {
            progress = nextProgress
        }
    }
    
    private func nextStory() {
        let storiesCount = stories.count
        let largeStoriesCount = stories[storyIndex].largeStory.count
        let nextLargeStoryIndex = (currentLargeStoryIndex + 1) < largeStoriesCount ? currentLargeStoryIndex + 1 : 0
        if currentLargeStoryIndex + 1 == largeStoriesCount {
            storyIndex = storyIndex + 1 >= storiesCount ? 0 : storyIndex + 1
            progress = 0
        } else {
            withAnimation {
                progress = CGFloat(nextLargeStoryIndex) / CGFloat(largeStoriesCount)
            }
        }
    }
    
    private func previousStory() {
        let storiesCount = stories.count
        let largeStoriesCount = stories[storyIndex].largeStory.count
        let previousLargeStoryIndex = (currentLargeStoryIndex - 1) >= 0 ? currentLargeStoryIndex - 1 : largeStoriesCount - 1
        if storyIndex == 0 && currentLargeStoryIndex == 0 {
            return
        } else if currentLargeStoryIndex == 0 {
            storyIndex = storyIndex - 1 < storiesCount ? storyIndex - 1 : 0
        }
        withAnimation {
            progress = CGFloat(previousLargeStoryIndex) / CGFloat(largeStoriesCount)
        }
    }
    
    private func closeStory() {
        let storiesCount = stories.count
        let largeStoriesCount = stories[storyIndex].largeStory.count
        if storyIndex + 1 != storiesCount {
            storyIndex = storyIndex + 1 >= storiesCount ? 0 : storyIndex + 1
        } else if currentLargeStoryIndex == largeStoriesCount - 1 {
            goToStories = false
            isViewed = false
        }
    }
    
    private func resetTimer() {
        cancellable?.cancel()
        timer = Self.createTimer(configuration: configuration)
        cancellable = timer.connect()
    }
    
    private static func createTimer(configuration: ProgressBarConfiguration) -> Timer.TimerPublisher {
        Timer.publish(every: configuration.timerTickInternal, on: .main, in: .common)
    }
}

#Preview {
    let largeStory_1_1 = LargeStory(largeImage: "MokStorie_1_1", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
    let largeStory_1_2 = LargeStory(largeImage: "MokStorie_1_2", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")
    let story_1 = Story(image: "MokStorie_1", text: "Text text text text text text text", isViewed: false, largeStory: [largeStory_1_1, largeStory_1_2])
    LargeStoriesView(stories: [story_1], storyIndex: 2, isViewed: .constant(false), goToStories: .constant(true))
}

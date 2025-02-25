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
    let largeStories: [LargeStory]
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
       }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoryView(story: currentLargeStory)
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
        // Реализуйте самостоятельно
    }
    
    private func previousStory() {
        // Реализуйте самостоятельно
    }
    
    private func closeStory() {
        // Реализуйте самостоятельно
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
    let stories = [LargeStory(largeImage: "MokStorie_1_1", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text"), LargeStory(largeImage: "MokStorie_1_2", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text")]
    LargeStoriesView(stories: stories, goToStories: .constant(true))
}

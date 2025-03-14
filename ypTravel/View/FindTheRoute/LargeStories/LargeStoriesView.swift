//
//  LargeStoriesView.swift
//  ypTravel
//
//  Created by Олег Кор on 22.02.2025.
//

import SwiftUI
import Combine

struct LargeStoriesView: View {
    @ObservedObject private var viewModel: StoriesViewModel
    @EnvironmentObject private var navigationArray: NavigationModel
    
    
    init(stories: [Story], storyIndex: Int, isViewed: Binding<Bool>, goToStories: Binding<Bool>) {
        _viewModel = ObservedObject(wrappedValue: StoriesViewModel(stories: stories, storyIndex: storyIndex, goToStories: goToStories, isViewed: isViewed))
       }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoryView(story: viewModel.currentLargeStory)
            ProgressBar(numberOfSections: viewModel.numberOfLargeStorySection, progress: viewModel.progress)
                .padding(.init(top: 28, leading: 12, bottom: 12, trailing: 12))
            CloseButton(action: {viewModel.goToStories = false; viewModel.isViewed = true})
                .padding(.top, 57)
                .padding(.trailing, 12)
        }
        .onAppear {
            viewModel.startTimer()
        }
        .onDisappear {
            viewModel.stopTimer()
        }
        .onReceive(viewModel.timerSend()) { _ in
            viewModel.timerTick()
        }
        .onTapGesture { size in
            size.x < UIScreen.main.bounds.width / 2 ? viewModel.previousStory() : viewModel.nextStory()
            viewModel.resetTimer()
        }
        .gesture(DragGesture()
            .onEnded { size in
                if size.translation.width < -50 {
                    viewModel.nextStory()
                    viewModel.resetTimer()
                } else if size.translation.width > 50 {
                    viewModel.previousStory()
                    viewModel.resetTimer()
                } else if size.translation.height > 50 {
                    viewModel.goToStories = false
                }
            }
        )
        .presentationDetents([.medium, .large])
    }
}

#Preview {
    NavigationStack {
        LargeStoriesView(stories: StoriesMokData.shared.stories, storyIndex: 1, isViewed: .constant(false), goToStories: .constant(true))
            .environmentObject(NavigationModel())
    }
}

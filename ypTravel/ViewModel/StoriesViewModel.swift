import SwiftUI
import Combine

@MainActor
final class StoriesViewModel: ObservableObject {
    
    @Published var storyIndex: Int
    @Published var progress: CGFloat = 0
    @Binding var isViewed: Bool
    @Binding var goToStories: Bool
    
    private var stories: [Story] = []
    private let configuration: ProgressBarConfiguration
    private var timer: Timer.TimerPublisher = Timer.publish(every: 5, on: .main, in: .common)
    private var cancellable: Cancellable?
    
    private var currentLargeStoryIndex: Int { Int(progress * CGFloat(stories[storyIndex].largeStory.count)) }
    var currentLargeStory: LargeStory { stories[storyIndex].largeStory[currentLargeStoryIndex] }
    var numberOfLargeStorySection: Int { stories[storyIndex].largeStory.count }
    
    
    init(stories: [Story], storyIndex: Int, goToStories: Binding<Bool>, isViewed: Binding<Bool>) {
        self.stories = stories
        self.storyIndex = storyIndex
        self._goToStories = goToStories
        self._isViewed = isViewed
        self.configuration = ProgressBarConfiguration(storiesCount: stories[storyIndex].largeStory.count)
        self.timer = Self.createTimer(configuration: configuration)
    }
    
    
    func timerTick() {
        print("Progress per tick: \(configuration.progressPerTick)")
        var nextProgress = progress + configuration.progressPerTick
        if nextProgress >= 1 {
            closeStory()
            nextProgress = 0
        }
        withAnimation {
            progress = nextProgress
        }
        print("Progress updated: \(progress)") // <-- Проверяем обновление
    }
    
    func timerSend() -> Timer.TimerPublisher {
        timer
    }
    
    func nextStory() {
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
    
    func previousStory() {
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
    
    func closeStory() {
        let storiesCount = stories.count
        let largeStoriesCount = stories[storyIndex].largeStory.count
        if storyIndex + 1 != storiesCount {
            storyIndex = storyIndex + 1 >= storiesCount ? 0 : storyIndex + 1
        } else if currentLargeStoryIndex == largeStoriesCount - 1 {
            goToStories = false
            isViewed = false
        }
    }
    
    func startTimer() {
        print("Starting timer...")
        timer = Self.createTimer(configuration: configuration)
//        cancellable = timer.connect()
        cancellable = timer
                .autoconnect()  // Это автоматически соединяет таймер с подписчиком
                .receive(on: DispatchQueue.main)  // Получаем события на главном потоке
                .sink { [weak self] _ in
                    print("Timer ticked")
                    self?.timerTick()
                }
    }
        
    
    func stopTimer() {
        print("Stopping timer...")
        cancellable?.cancel()
    }
    
    func resetTimer() {
        print("Resetting timer...")
        stopTimer()
        startTimer()
    }
    
     private static func createTimer(configuration: ProgressBarConfiguration) -> Timer.TimerPublisher {
         Timer.publish(every: configuration.timerTickInternal, on: .main, in: .common)
    }
    
}


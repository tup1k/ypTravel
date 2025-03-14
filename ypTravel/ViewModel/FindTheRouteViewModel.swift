import SwiftUI

@MainActor
final class FindTheRouteViewModel: ObservableObject {
    @Published var stories: [Story]
    @Published var selectedStory: Story
    @Published var selectedLargeStory: Int
    @Published var goToStories: Bool
    
    @Published var fromCity: City
    @Published var fromStation: Station
    @Published var toCity: City
    @Published var toStation: Station
    @Published var allCities: [City] = []
    @Published var isLoading: Bool = false
    private var isLoaded: Bool = false
    private var newStations: [Station] = []
    private var cityName: String = ""
   
 
    
    init(stories: [Story] = StoriesMokData.shared.stories, selectedStory: Story = Story(image: "MokStorie_2", text: "", isViewed: false, largeStory: []), selectedLargeStory: Int = 0, goToStories: Bool = false , fromCity: City, toCity: City, fromStation: Station, toStation: Station) {
        self.stories = stories
        self.selectedStory = selectedStory
        self.selectedLargeStory = selectedLargeStory
        self.goToStories = goToStories
        self.fromCity = fromCity
        self.fromStation = fromStation
        self.toCity = toCity
        self.toStation = toStation
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
    
    
    func loadCities() async throws {
        guard !isLoaded else { return }
        isLoading = true
        isLoaded = true
        
        defer {
            isLoading = false
        }
        
        do {
            let fetchedCities = try await DataNetworkService.shared.allStations()
            
            for city in fetchedCities {
                for station in city.stations ?? [] {
                    let oneMoreStation = Station(name: station.title ?? "Название станции отсутствует", code: station.codes?.yandex_code ?? "")
                    self.newStations.append(oneMoreStation)
                }
                if city.title == nil || city.title == "" {
                    cityName = "Название города отсутствует"
                } else {
                    cityName = city.title ?? "Название города отсутствует"
                }
                let newCity = City(name: cityName, stations: newStations)
                self.allCities.append(newCity)
                newStations.removeAll()
            }
            
            CommonData.shared.commonCities = allCities
            
        } catch {
            print("Ошибка сохранения массива городов и станций: \(error.localizedDescription)")
            throw error
        }
        
    }
}

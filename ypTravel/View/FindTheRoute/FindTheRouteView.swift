//
//  ChooseDirectionView.swift
//  ypTravel
//
//  Created by Олег Кор on 03.02.2025.
//

import SwiftUI

struct FindTheRouteView: View {
    @EnvironmentObject var navigationArray: NavigationModel
//    @StateObject private var navigationArray = NavigationModel()
    @ObservedObject private var storiesViewModel = StoriesViewModel()
    @ObservedObject private var routeViewModel = FindTheRouteViewModel(fromPlace: Station(name: "", code: ""), toPlace: Station(name: "", code: ""))
    var networkViewModel = DataNetworkService()
     
//    @State private var fromPlace: String = ""
//    @State private var toPlace: String = ""
//    @State private var selectedStory: Story = Story(image: "MokStorie_2", text: "", isViewed: false, largeStory: [])
//    @State private var selectedLargeStory: Int = 0
    @State private var goToStories: Bool = false
    @State private var goToRouteCarrier: Bool = false
    @Binding var tabBarIsHidden: Bool
   
    let rows = [GridItem(.flexible())]
    
//    private var isStoryViewed: Binding<Bool> {
//        Binding<Bool> (
//            get: {
//                let storyIndex = storiesViewModel.stories.firstIndex(where: { selectedStory == $0 })
//                return storiesViewModel.stories[storyIndex ?? 0].isViewed
//            },
//            set: {
//                let storyIndex = storiesViewModel.stories.firstIndex(where: { selectedStory == $0 })
//                storiesViewModel.stories[storyIndex ?? 0].isViewed = $0
//            }
//        )
//    }
    
    var body: some View {
        NavigationStack(path: $navigationArray.path) {
            VStack(spacing: 20) {
                ScrollView (.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, spacing: 20) {
                        ForEach(0..<storiesViewModel.stories.count, id: \.self) { index in
                            let story = storiesViewModel.stories[index]
                            Button {
                                storiesViewModel.selectedStory = story
                                storiesViewModel.selectedLargeStory = index
                                goToStories = true
                            } label: {
                                StoriesCellView(storyImage: story.image, storyText: story.text, isViewed: story.isViewed)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                
                VStack(spacing: 16) {
                    ZStack {
                        HStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 0) {
                                FromToButton(fromTo: $routeViewModel.fromPlace, buttonPlaceholder: "Откуда", isUp: true) {
                                    navigationArray.push(.cityView(true))
                                    tabBarIsHidden = true
                                }
                                
                                FromToButton(fromTo: $routeViewModel.toPlace, buttonPlaceholder: "Куда", isUp: false) {
                                    navigationArray.push(.cityView(false))
                                    tabBarIsHidden = true
                                }
                            }
                            .background(.ypWhiteUniversal)
                            .cornerRadius(20)
                            
                            Button(action: {swap(&routeViewModel.fromPlace, &routeViewModel.toPlace)}) {
                                Image("ReverseButton")
                                    .resizable()
                                    .frame(width: 36, height: 36)
                            }
                        }
                    }
                    .padding(16)
                    .background(.ypBlue)
                    .cornerRadius(20)
                    .padding(.horizontal, 16)
                    
                    FindRouteButton(isActive: !routeViewModel.fromPlace.name.isEmpty && !routeViewModel.toPlace.name.isEmpty) {
                        goToRouteCarrier = true
                        tabBarIsHidden = true
                    }
                }
                
                Spacer(minLength: 273)
            }
            .onAppear {
                tabBarIsHidden = false
            }
            .navigationDestination(for: ListOfView.self) { viewList in
                Router.destination(for: viewList, fromPlace: $routeViewModel.fromPlace, toPlace: $routeViewModel.toPlace)
            }
            .navigationDestination(isPresented: $goToRouteCarrier) {
                CarrierListView(fromPlace: $routeViewModel.fromPlace, toPlace: $routeViewModel.toPlace)
            }
            .fullScreenCover(isPresented: $goToStories, onDismiss: { tabBarIsHidden = false }) {
                LargeStoriesView(stories: storiesViewModel.stories, storyIndex: $storiesViewModel.selectedLargeStory, isViewed: storiesViewModel.isStoryViewed, goToStories: $goToStories)
            }
            .background(Color.ypWhite)
        }
        .environmentObject(navigationArray)
        
    }
}


#Preview {
    FindTheRouteView(tabBarIsHidden: .constant(false))
        .environmentObject(NavigationModel())
}

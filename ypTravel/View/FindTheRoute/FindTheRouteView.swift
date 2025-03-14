//
//  ChooseDirectionView.swift
//  ypTravel
//
//  Created by Олег Кор on 03.02.2025.
//

import SwiftUI

struct FindTheRouteView: View {
    @StateObject private var navigationArray: NavigationModel = NavigationModel()
    @StateObject private var routeViewModel = FindTheRouteViewModel(
        fromCity: City(name: "", stations: [Station(name: "", code: "")]),
        toCity: City(name: "", stations: [Station(name: "", code: "")]),
        fromStation: Station(name: "", code: ""),
        toStation: Station(name: "", code: "")
    )
    
//    @State private var goToStories: Bool = false
    @State private var goToRouteCarrier: Bool = false
    @Binding var tabBarIsHidden: Bool
    var networkViewModel = DataNetworkService()
    let rows = [GridItem(.flexible())]
    
    
    var body: some View {
        ZStack {
            NavigationStack(path: $navigationArray.path) {
                VStack(spacing: 20) {
                    ScrollView (.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: rows, spacing: 20) {
                            ForEach(routeViewModel.stories) { story in
                                Button {
                                    routeViewModel.selectStory(story: story)
                                    routeViewModel.goToStories = true
                                } label: {
                                    StoriesCellView(storyImage: story.image, storyText: story.text, isViewed: story.isViewed)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    VStack(spacing: 16) {
                        FindTheRouteTab(fromCity: $routeViewModel.fromCity, fromStation: $routeViewModel.fromStation, toCity: $routeViewModel.toCity, toStation: $routeViewModel.toStation, tabBarIsHidden: $tabBarIsHidden)
                        
                        FindRouteButton(isActive: !routeViewModel.fromStation.name.isEmpty && !routeViewModel.toStation.name.isEmpty) {
                            goToRouteCarrier = true
                            tabBarIsHidden = true
                        }
                    }
                    Spacer(minLength: 273)
                }
                .onAppear {
                    tabBarIsHidden = false
                    Task {
                        try await routeViewModel.loadCities()
                    }
                }
                .navigationDestination(for: ListOfView.self) { viewList in
                    Router.destination(for: viewList, fromCity: $routeViewModel.fromCity, fromPlace: $routeViewModel.fromStation, toCity: $routeViewModel.toCity, toPlace: $routeViewModel.toStation)
                }
                .navigationDestination(isPresented: $goToRouteCarrier) {
                    CarrierListView(fromPlace: routeViewModel.fromStation, toPlace: routeViewModel.toStation)
                }
                .fullScreenCover(isPresented: $routeViewModel.goToStories, onDismiss: { tabBarIsHidden = false }) {
                    LargeStoriesView(stories: routeViewModel.stories, storyIndex: routeViewModel.selectedLargeStory, isViewed: routeViewModel.isStoryViewed, goToStories: $routeViewModel.goToStories)
                }
                .background(Color.ypWhite)
            }
            .environmentObject(navigationArray)
            if routeViewModel.isLoading {
                ZStack {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea(.all)
                    LoadingPlaceholder()
                }
            }
        }
    }
}


#Preview {
    FindTheRouteView(
        tabBarIsHidden: .constant(false)
    )
        .environmentObject(NavigationModel())
}

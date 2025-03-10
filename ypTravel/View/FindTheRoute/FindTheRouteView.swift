//
//  ChooseDirectionView.swift
//  ypTravel
//
//  Created by Олег Кор on 03.02.2025.
//

import SwiftUI

struct FindTheRouteView: View {
//    @EnvironmentObject var navigationArray: NavigationModel
    @StateObject private var navigationArray: NavigationModel = NavigationModel()
    @ObservedObject private var storiesViewModel = StoriesViewModel()
    @ObservedObject private var routeViewModel = FindTheRouteViewModel(fromCity: City(name: "", stations: [Station(name: "", code: "")]), toCity: City(name: "", stations: [Station(name: "", code: "")]), fromStation: Station(name: "", code: ""), toStation: Station(name: "", code: ""))
    @State private var goToStories: Bool = false
    @State private var goToRouteCarrier: Bool = false
    @Binding var tabBarIsHidden: Bool
    var networkViewModel = DataNetworkService()
    let rows = [GridItem(.flexible())]
    
    
    var body: some View {
        NavigationStack(path: $navigationArray.path) {
            VStack(spacing: 20) {
                ScrollView (.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, spacing: 20) {
                        ForEach(storiesViewModel.stories) { story in
                            Button {
                                storiesViewModel.selectStory(story: story)
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
                                FromToButton(buttonPlaceholder: "Откуда", cityName: routeViewModel.fromCity.name, stationName: routeViewModel.fromStation.name, isUp: true) {
                                    navigationArray.push(.cityView(true))
                                    tabBarIsHidden = true
                                }
                                
                                FromToButton(buttonPlaceholder: "Куда", cityName: routeViewModel.toCity.name, stationName: routeViewModel.toStation.name, isUp: false) {
                                    navigationArray.push(.cityView(false))
                                    tabBarIsHidden = true
                                }
                            }
                            .background(.ypWhiteUniversal)
                            .cornerRadius(20)
                            
                            Button(action: {swap(&routeViewModel.fromStation, &routeViewModel.toStation)}) {
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
                    
                    FindRouteButton(isActive: !routeViewModel.fromStation.name.isEmpty && !routeViewModel.toStation.name.isEmpty) {
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
                Router.destination(for: viewList, fromCity: $routeViewModel.fromCity, fromPlace: $routeViewModel.fromStation, toCity: $routeViewModel.toCity, toPlace: $routeViewModel.toStation)
            }
            .navigationDestination(isPresented: $goToRouteCarrier) {
                CarrierListView(fromPlace: $routeViewModel.fromStation, toPlace: $routeViewModel.toStation)
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

//
//  ChooseDirectionView.swift
//  ypTravel
//
//  Created by Олег Кор on 03.02.2025.
//

import SwiftUI


struct FindTheRouteView: View {
    @StateObject private var viewModel = StoriesViewModel()
    @StateObject private var navigationArray = NavigationModel()
    @State private var fromPlace: String = ""
    @State private var toPlace: String = ""
    @State private var selectedStory: [LargeStory] = []
    @State private var goToStories: Bool = false
    @State private var goToRouteCarrier: Bool = false
    @Binding var tabBarIsHidden: Bool
    
    let rows = [GridItem(.flexible())]
    
    var body: some View {
        NavigationStack(path: $navigationArray.path) {
            VStack(spacing: 20) {
                ScrollView (.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, spacing: 20) {
                        ForEach(viewModel.stories) { story in
                            StoriesCellView(story: story, action: {
                                goToStories = true
                                tabBarIsHidden = true
                                self.selectedStory = story.largeStory
                            })
                        }
                    }
                    .padding(.horizontal, 16)
                }
                
                VStack(spacing: 16) {
                    ZStack {
                        HStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 0) {
                                FromToButton(fromTo: fromPlace, buttonPlaceholder: "Откуда", isUp: true) {
                                    navigationArray.push(.cityView(true))
                                    tabBarIsHidden = true
                                }
                                
                                FromToButton(fromTo: toPlace, buttonPlaceholder: "Куда", isUp: false) {
                                    navigationArray.push(.cityView(false))
                                    tabBarIsHidden = true
                                }
                            }
                            .background(.ypWhiteUniversal)
                            .cornerRadius(20)
                            
                            Button(action: {swap(&fromPlace, &toPlace)}) {
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
                    .onAppear {
                        tabBarIsHidden = false
                    }
                    
                    FindRouteButton(isActive: !fromPlace.isEmpty && !toPlace.isEmpty) {
                        goToRouteCarrier = true
                        tabBarIsHidden = true
                    }
                }
                .navigationDestination(for: ListOfView.self) { viewList in
                    Router.destination(for: viewList, fromPlace: $fromPlace, toPlace: $toPlace)
                }
                .navigationDestination(isPresented: $goToRouteCarrier) {
                    CarrierListView(fromPlace: $fromPlace, toPlace: $toPlace)
                }
                .navigationDestination(isPresented: $goToStories) {
                    LargeStoriesView(stories: selectedStory, goToStories: $goToStories, storyIndex: <#T##Int#>, isViewed: <#T##Binding<Bool>#>)
                }
                Spacer(minLength: 273)
            }
            .background(Color.ypWhite)
        }
        .environmentObject(navigationArray)
    }
}


#Preview {
    FindTheRouteView(tabBarIsHidden: .constant(false))
}

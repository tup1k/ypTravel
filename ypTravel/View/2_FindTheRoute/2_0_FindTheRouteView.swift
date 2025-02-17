//
//  ChooseDirectionView.swift
//  ypTravel
//
//  Created by Олег Кор on 03.02.2025.
//

import SwiftUI


struct FindTheRouteView: View {
    @StateObject var viewModel = StoriesViewModel()
    @StateObject var navigationArray = NavigationModel()
    @State private var fromPlace: String = ""
    @State private var toPlace: String = ""
    @State private var goToRouteCarrier: Bool = false
    @Binding var tabBarIsHidden: Bool
    
    let rows = [GridItem(.flexible())]
    
    var body: some View {
        NavigationStack(path: $navigationArray.path) {
            VStack(spacing: 20) {
                ScrollView (.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, alignment: .center, spacing: 20) {
                        ForEach(viewModel.stories) { story in
                            StoriesCellView(story: story)
                        }
                    }
                    .padding(.horizontal, 20)
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
                    CarrierListView(from: fromPlace, to: toPlace, isFiltered: false)
                }
            }
            Spacer(minLength: 273)
        }
        .environmentObject(navigationArray)
    }
}


#Preview {
    FindTheRouteView(tabBarIsHidden: .constant(false))
}

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
    
    let rows = [GridItem(.flexible())]
//    var isFrom: Bool
    
    var body: some View {
        NavigationStack(path: $navigationArray.path) {
            VStack(spacing: 20) {
                ScrollView (.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, alignment: .center, spacing: 20) {
                        ForEach(viewModel.stories) { story in
                            StoriesCellView(story: story)
                        }
                    }
                }
                
                VStack(spacing: 16) {
                    ZStack {
                        HStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 0) {
                                    FromToButton(fromTo: "", buttonPlaceholder: "Откуда", isUp: true) {
                                        navigationArray.push(.cityView(true))
                                    }
                                   
                                    FromToButton(fromTo: "", buttonPlaceholder: "Куда", isUp: false) {
                                        navigationArray.push(.cityView(false))
                                    }
                            }
                            .background(.ypWhite)
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
                    FindRouteButton(isActive: !fromPlace.isEmpty && !toPlace.isEmpty) {
                       goToRouteCarrier = true
                    }
                    
                }
                .navigationDestination(for: ListOfView.self) { viewList in
                    Router.destination(for: viewList)
                }
                .navigationDestination(isPresented: $goToRouteCarrier) {
                    CarrierListView(from: "Moscow", to: "Санкт-Петербург")
                }
                Spacer()
            }
            
        }
        .environmentObject(navigationArray)
    }
}


#Preview {
    FindTheRouteView()
}

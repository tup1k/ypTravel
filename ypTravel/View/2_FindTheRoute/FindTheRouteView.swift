//
//  ChooseDirectionView.swift
//  ypTravel
//
//  Created by Олег Кор on 03.02.2025.
//

import SwiftUI


struct FindTheRouteView: View {
    @StateObject var viewModel = StoriesViewModel()
    let rows = [GridItem(.flexible())]
    @State private var fromPlace: String = "Откуда"
    @State private var toPlace: String = "Куда"
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView (.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, alignment: .center, spacing: 20) {
                        ForEach(viewModel.stories) { story in
                            StoriesCellView(story: story)
                        }
                    }
                }
                
                HStack {
                    VStack {
                        NavigationLink(destination: CitySelectionView()) {
                            Text(fromPlace)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 48)
                                .foregroundColor(.ypGray)
                                .font(.system(size: 17, weight: .medium))
                        }
                        
                        NavigationLink(destination: CitySelectionView()) {
                            Text(toPlace)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 48)
                                .foregroundColor(.ypGray)
                                .font(.system(size: 17, weight: .medium))
                        }
                    }
                    .frame(height: 128)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)
                    .background(Color.white)
                    .cornerRadius(16)
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    .padding(.bottom, 8)
                    
                    Button(action: {}) {
                        Image("ReverseButton")
                            .resizable()
                            .frame(width: 36, height: 36)
                            .padding(.trailing, 16)
                    }
                }
                .listStyle(.inset)
                .background(Color.ypBlue)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal, 16)
                .frame(maxHeight: 128)
                
                
                NavigationLink(destination: CarrierListView()) {
                    Rectangle()
                        .frame(maxWidth: 150, maxHeight: 60)
                        .foregroundColor(.ypBlue)
                        .cornerRadius(16)
                        .overlay(
                            Text("Найти")
                                .font(.system(size: 17, weight: .bold))
                                .frame(maxWidth: 150, maxHeight: 60)
                                .foregroundColor(.ypWhite)
                        )
                }
                .padding(.top, 16)
            
                Spacer()
            }
        }
    }
}


#Preview {
    FindTheRouteView()
}

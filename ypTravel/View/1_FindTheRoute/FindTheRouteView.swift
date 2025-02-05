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
    
    var body: some View {
        VStack {
            ScrollView (.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .center, spacing: 20) {
                    ForEach(viewModel.stories, id: \.self) { story in
                        StoriesCellView(story: story)
                    }
                }
            }
            
            HStack {
                List {
                    Text("Популярные маршруты")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("Популярные маршруты")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Button(action: {}) {
                    Text("Смотреть все")
                        .font(.caption)
                        .foregroundColor(.blue)
                        .background(.ypBlack)
                }
            }
            .frame(height: 190)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .background(.ypBlue)
        
            Button(action:{}) {
                Text("Найти маршрут")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(.ypBlue)
                    .cornerRadius(20)
            }
        }
    }
}

#Preview {
    FindTheRouteView()
}

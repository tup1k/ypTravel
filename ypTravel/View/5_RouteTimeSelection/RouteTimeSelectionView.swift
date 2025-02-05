//
//  RouteTimeSelectionView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct RouteTimeSelectionView: View {
    @State private var from6to12timeFilterIsOn = false
    @State private var from12to18timeFilterIsOn = false
    @State private var from18to24timeFilterIsOn = false
    @State private var from24to06timeFilterIsOn = false
    @State private var isShowWithTransfers = false
    
    
    var body: some View {
        VStack {
            Text("Время отправления")
                .padding()
                .fontWeight(.bold)
                .font(.system(size: 24))
            
            CheckBoxView(timeText: "Утро 06:00 - 12:00", isSquare: true, checked: $from6to12timeFilterIsOn)
            CheckBoxView(timeText: "День 12:00 - 18:00", isSquare: true, checked: $from12to18timeFilterIsOn)
            CheckBoxView(timeText: "Вечер 18:00 - 10:00", isSquare: true, checked: $from18to24timeFilterIsOn)
            CheckBoxView(timeText: "Ночь 00:00 - 06:00", isSquare: true, checked: $from24to06timeFilterIsOn)
            
            Text("Подсказывать варианты с пересадками")
                .padding()
                .fontWeight(.bold)
                .font(.system(size: 24))
            
            CheckBoxView(timeText: "Да", isSquare: false, checked: $isShowWithTransfers)
            CheckBoxView(timeText: "Нет", isSquare: false, checked: $isShowWithTransfers)

            Button(action: {}) {
            
                Text("Применить фильтры")
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: .infinity, height: 44)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
            
        }
        
       
            
        }
            
    }


private struct CheckBoxView: View {
    var timeText: String
    var isSquare: Bool
    @Binding var checked: Bool
    
    private var circleOrSquare: String {
        isSquare ? "square" : "circle"
    }
    
    var body: some View {
        HStack {
            Text(timeText)
                .font(.system(size: 17))
            Image(systemName: checked ? "checkmark." + circleOrSquare + ".fill" : circleOrSquare)
                .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
                .onTapGesture {
                    self.checked.toggle()
                }
        }
        .padding()
    }
}
    


#Preview {
    RouteTimeSelectionView()
}

//
//  RouteTimeSelectionView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct RouteTimeSelectionView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var from6to12timeFilterIsOn = false
    @State private var from12to18timeFilterIsOn = false
    @State private var from18to24timeFilterIsOn = false
    @State private var from24to06timeFilterIsOn = false
    
    @State private var selectedDepartureTime: [String] = []
    @StateObject private var viewModel = TimeOptionsModel()
    
    @Binding var isShowWithTransfers: Bool?
    @Binding var isFiltered: Bool
    @State private var isShowing: Bool = false
    
    var isFilterActive: Bool {
        return from6to12timeFilterIsOn || from12to18timeFilterIsOn || from18to24timeFilterIsOn || from24to06timeFilterIsOn || isShowWithTransfers != nil
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.ypBlack)
                        .font(.system(size: 22))
                        .padding(.leading, 8)
                }
                Spacer()
            }
            
            Text("Время отправления")
                .padding()
                .fontWeight(.bold)
                .font(.system(size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            CheckBoxView(timeText: "Утро 06:00 - 12:00", isSquare: true, checked: $from6to12timeFilterIsOn)
            CheckBoxView(timeText: "День 12:00 - 18:00", isSquare: true, checked: $from12to18timeFilterIsOn)
            CheckBoxView(timeText: "Вечер 18:00 - 10:00", isSquare: true, checked: $from18to24timeFilterIsOn)
            CheckBoxView(timeText: "Ночь 00:00 - 06:00", isSquare: true, checked: $from24to06timeFilterIsOn)
            
            Text("Подсказывать варианты с пересадками")
                .padding()
                .fontWeight(.bold)
                .font(.system(size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Text("Да")
                Spacer()
                Image(systemName: isShowWithTransfers ?? false ? "largecircle.fill.circle" : "circle")
                    .onTapGesture {
                        isShowWithTransfers = true
                    }
               
            }
            .padding()
            
            HStack {
                Text("Нет")
                Spacer()
                Image(systemName: !(isShowWithTransfers ?? true) ? "largecircle.fill.circle" : "circle")
                    .onTapGesture {
                        isShowWithTransfers = false
                    }
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                dismiss()
                isFiltered = isFilterActive
            })
            {
                Text("Применить")
                    .frame(width: 343, height: 60)
                    .padding(.horizontal, 16)
                    .background(.ypBlue)
                    .foregroundColor(.ypWhiteUniversal)
                    .cornerRadius(16)
                    .font(.system(size: 17, weight: .bold))
                    .padding(.bottom, 24)
                    .disabled(isFilterActive)
                    .opacity(isFilterActive ? 1 : 0)
            }
            .frame(maxWidth: .infinity, alignment: .bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationBarBackButtonHidden(true)
        .background(.ypWhite)
        }
            
    }
    


#Preview {
    RouteTimeSelectionView(isShowWithTransfers: .constant(false), isFiltered: .constant(false))
}

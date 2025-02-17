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
    @State private var isShowWithTransfers: Bool = false
    @State private var selectedDepartureTime: [String] = []
    @StateObject var viewModel = TimeOptionsModel()
    
    @Binding var isFiltered: Bool
    
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
                Image(systemName: isShowWithTransfers ? "largecircle.fill.circle" : "circle")
                    .onTapGesture {
                        isShowWithTransfers = true
                    }
            }
            .padding()
            
            HStack {
                Text("Нет")
                Spacer()
                Image(systemName: !isShowWithTransfers ? "largecircle.fill.circle" : "circle")
                    .onTapGesture {
                        isShowWithTransfers = false
                    }
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                dismiss()
                if from6to12timeFilterIsOn || from12to18timeFilterIsOn || from18to24timeFilterIsOn || from24to06timeFilterIsOn || isShowWithTransfers {
                    isFiltered = true
                } else {
                    isFiltered = false
                }
                
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
                    .disabled(from6to12timeFilterIsOn || from12to18timeFilterIsOn || from18to24timeFilterIsOn || from24to06timeFilterIsOn || isShowWithTransfers)
                    .opacity(from6to12timeFilterIsOn || from12to18timeFilterIsOn || from18to24timeFilterIsOn || from24to06timeFilterIsOn || isShowWithTransfers ? 1 : 0)
            }
            .frame(maxWidth: .infinity, alignment: .bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationBarBackButtonHidden(true)
        }
            
    }
    


#Preview {
    RouteTimeSelectionView(isFiltered: .constant(false))
}

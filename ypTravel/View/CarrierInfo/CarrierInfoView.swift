//
//  CarrierInfoView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI
import Kingfisher

struct CarrierInfoView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var viewModel = CarrierInfoViewModel()
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.ypBlack)
                        .font(.system(size: 22))
                }
                Spacer()
                Text("Информация о перевозчике")
                    .font(.headline)
                Spacer()
            }
            
//            if let imageURL = viewModel.carrierList.carrierImage {
//                KFImage(imageURL)
//                
            Image(viewModel.carrierList.carrierImage)
                .resizable()
                .scaledToFit()
                .onAppear {
                    print(viewModel.carrierList.carrierImage)
                }
//            }
            
            Text(viewModel.carrierList.carrierName)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.ypBlack)
            
            VStack(alignment: .leading) {
                Text("E-mail")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.ypBlack)
                Text(String(viewModel.carrierList.carrierMail))
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.ypBlue)
            }
            
            
            VStack(alignment: .leading) {
                Text("Телефон")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.ypBlack)
                Text(viewModel.carrierList.carrierPhone)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.ypBlue)
                Spacer()
            }
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        .background(.ypWhite)
    }
}

#Preview {
    CarrierInfoView()
}

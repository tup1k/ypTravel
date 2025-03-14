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
    var routeCarrierInfo: RouteCarrierStruct
    
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
            
            KFImage(URL(string: routeCarrierInfo.carrierImage))
                .placeholder {
                    Text("Логотип перевозчика отсутствует")
                        .frame(width: 343, height: 104)
                }
                .resizable()
                .frame(alignment: .center)
                .scaledToFit()
                .padding(.horizontal, 16)
                    
//            AsyncImage(url: URL(string: routeCarrierInfo.carrierImage)) { image in
////                image.resizable()
//                image.scaledToFill()
//                .frame(width: 343, height: 104)
//                .cornerRadius(24)
//            } placeholder: {
//                Text("Логотип перевозчика отсутствует")
//                    .frame(width: 343, height: 104)
//            }

            Text(routeCarrierInfo.carrierName)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.ypBlack)
            
            VStack(alignment: .leading) {
                Text("E-mail")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.ypBlack)
                Text(String(routeCarrierInfo.carrierMail))
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.ypBlue)
            }
            
            
            VStack(alignment: .leading) {
                Text("Телефон")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.ypBlack)
                Text(routeCarrierInfo.carrierPhone)
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
    CarrierInfoView(routeCarrierInfo: RouteCarrierStruct(carrierImage: "https://yastat.net/s3/rasp/media/data/company/logo/logo.gif", carrierName: "РЖД", transferInfo: true, routeDate: "", routeStartTime: "", routeEndTime: "", routeDuration: "", carrierCode: "112", carrierMail: "rzd@rzd.ru", carrierPhone: "+79261234567"))
}

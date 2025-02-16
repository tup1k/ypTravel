//
//  CarrierListCell.swift
//  ypTravel
//
//  Created by Олег Кор on 06.02.2025.
//

import SwiftUI

struct CarrierListCell: View {
    var routeCarrierInfo: RouteCarrierStruct
    
    var body: some View {
        VStack {
            HStack {
                Image(routeCarrierInfo.carrierImage)
                    .resizable()
                    .frame(width: 38, height: 38)
                VStack(alignment: .leading) {
                    Text(routeCarrierInfo.carrierName)
                        .foregroundStyle(.ypBlackUniversal)
                        .font(.system(size: 17, weight: .regular, design: .default))
                    Text(routeCarrierInfo.transferInfo)
                        .font(.system(size: 12, weight: .regular, design: .default))
                        .foregroundColor(Color.ypRed)
                }
                Spacer()
                Text(routeCarrierInfo.routeDate)
                    .foregroundStyle(.ypBlackUniversal)
                    .padding(.bottom)
                    .font(.system(size: 12, weight: .regular, design: .default))
            }
            .padding(.horizontal, 14)
            .padding(.top, 14)
            .padding(.bottom, 18)
 
            HStack(alignment: .center) {
                Text(routeCarrierInfo.routeStartTime)
                    .foregroundStyle(.ypBlackUniversal)
                    .scaledToFit()
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 17, weight: .regular, design: .default))
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.ypGray)
                Text("\(routeCarrierInfo.routeDuration) часов")
                    .foregroundStyle(.ypBlackUniversal)
                    .font(.system(size: 12, weight: .regular, design: .default))
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.ypGray)
                Text(routeCarrierInfo.routeEndTime)
                    .foregroundStyle(.ypBlackUniversal)
                    .font(.system(size: 17, weight: .regular, design: .default))
            }
            .padding(.horizontal, 14)
            .padding(.bottom, 14)
        }
        .background(.ypLightGray)
        .cornerRadius(24)
        .padding(.horizontal, 16)
    }
}

#Preview {
    CarrierListCell(routeCarrierInfo: RouteCarrierStruct(carrierImage: "RZD", carrierName: "РЖД", transferInfo: "С пересадкой в Костроме", routeDate: "14 января", routeStartTime: "22:30", routeEndTime: "08:15", routeDuration: "20"))
}



//
//  CarrierInfoView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct CarrierInfoView: View {
    @Environment(\.dismiss) private var dismiss
    
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
            
            Image("RZDLarge")
                .padding()
            
            Text("ОАО «РЖД»")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.ypBlack)
            
            VStack(alignment: .leading) {
                Text("E-mail")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.ypBlack)
                Text("i.lozgkina@yandex.ru")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.ypBlue)
            }
            
            VStack(alignment: .leading) {
                Text("Телефон")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.ypBlack)
                Text("+7 (904) 329-27-71")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.ypBlue)
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    CarrierInfoView()
}

//
//  CarrierInfoView.swift
//  ypTravel
//
//  Created by Олег Кор on 05.02.2025.
//

import SwiftUI

struct CarrierInfoView: View {
    var body: some View {
        VStack {
            Image("RZDLarge")
            VStack {
                Text("ОАО «РЖД»")
                    .font(.system(size: 24, weight: .bold))
                Text("E-mail")
                Text("i.lozgkina@yandex.ru")
                Text("Телефон")
                Text("+7 (904) 329-27-71")
            }
          
            
            
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    CarrierInfoView()
}

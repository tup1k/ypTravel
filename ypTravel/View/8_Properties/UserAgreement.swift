//
//  UserAgreement.swift
//  ypTravel
//
//  Created by Олег Кор on 08.02.2025.
//

import SwiftUI

struct UserAgreement: View {
    
    @Binding var tabBarIsHidden: Bool
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
                tabBarIsHidden = false
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.ypBlack)
                    .font(.system(size: 22))
                    .padding(.leading, 8)
            }
            Spacer()
            Text("Пользовательское соглашение")
                .font(.headline)
            Spacer()
        }
        
//        ScrollView {
//            VStack(alignment: .leading){
//                Text("Оферта на оказание образовательных услуг дополнительного образования Яндекс.Практикум для физических лиц")
//                    .font(.system(size: 24, weight: .bold, design: .default))
//                    .padding(.bottom, 8)
//                Text("Данный документ является действующим, если расположен по адресу: https://yandex.ru/legal/practicum_offer \n\nРоссийская Федерация, город Москва")
//                    .font(.system(size: 17, weight: .regular, design: .default))
//                    .padding(.bottom, 24)
//                Text("1. ТЕРМИНЫ")
//                    .font(.system(size: 24, weight: .bold, design: .default))
//                Text("Понятия, используемые в Оферте, означают следующее:\n\nАвторизованные адреса — адреса электронной почты каждой Стороны. Авторизованным адресом Исполнителя является адрес электронной почты, указанный в разделе 11 Оферты. Авторизованным адресом Студента является адрес электронной почты, указанный Студентом в Личном кабинет.\n\nВводный курс — начальный Курс обучения по представленным на Сервисе Программам обучения в рамках выбранной Студентом Профессии или Курсу, рассчитанный на определенное количество часов самостоятельного обучения, который предоставляется Студенту единожды при регистрации на Сервисе на безвозмездной основе. В процессе обучения в рамках Вводного курса Студенту предоставляется возможность ознакомления с работой Сервиса и определения возможности Студента продолжить обучение в рамках Полного курса по выбранной Студентом Программе обучения. Точное количество часов обучения в рамках Вводного курса зависит от выбранной Студентом Профессии или Курса и определяется в Программе обучения, размещенной на Сервисе. Максимальный срок освоения Вводного курса составляет 1 (один) год с даты начала обучения.")
//            }
//            .padding(.horizontal, 16)
//        }
        NavigationView {
            WebView(url: URL(string: "https://yandex.ru/legal/practicum_offer")!)
                
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    UserAgreement(tabBarIsHidden: .constant(true))
}

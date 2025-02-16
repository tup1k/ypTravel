//
//  CheckBoxView.swift
//  ypTravel
//
//  Created by Олег Кор on 16.02.2025.
//

import SwiftUI

struct CheckBoxView: View {
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
            Spacer()
            Image(systemName: checked ? "checkmark." + circleOrSquare + ".fill" : circleOrSquare)
                .onTapGesture {
                    self.checked.toggle()
                }
        }
        .padding()
    }
}

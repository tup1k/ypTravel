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
    
    private var imageName: String {
        isSquare ? "square" : "circle"
    }
    
    var body: some View {
        HStack {
            Text(timeText)
                .font(.system(size: 17))
            Spacer()
            Image(systemName: checked ? "checkmark." + imageName + ".fill" : imageName)
                .onTapGesture {
                    self.checked.toggle()
                }
        }
        .padding()
    }
}

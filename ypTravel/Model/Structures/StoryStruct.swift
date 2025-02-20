//
//  Stories.swift
//  ypTravel
//
//  Created by Олег Кор on 04.02.2025.
//

import Foundation

struct Story: Hashable, Identifiable {
    let id = UUID()
    let imageName: String
    let text: String
}


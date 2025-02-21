//
//  TimeSlot.swift
//  ypTravel
//
//  Created by Олег Кор on 16.02.2025.
//

import Foundation

struct TimeSlot: Hashable, Identifiable {
    let id = UUID()
    let timeName: String
    let starTime: String
    let endTime: String
}

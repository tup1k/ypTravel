//
//  TimeSlot.swift
//  ypTravel
//
//  Created by Олег Кор on 16.02.2025.
//

import SwiftUI

struct TimeSlot: Hashable, Identifiable {
    var id = UUID()
    var timeName: String
    var starTime: String
    var endTime: String
}

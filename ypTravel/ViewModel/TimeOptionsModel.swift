//
//  TimeOptionsFilter.swift
//  ypTravel
//
//  Created by Олег Кор on 16.02.2025.
//
import SwiftUI

class TimeOptionsModel: ObservableObject {
    @Published var timeSlots: [TimeSlot]
    
    init() {
        self.timeSlots = [
            TimeSlot(timeName: "Утро", starTime: "06:00", endTime: "12:00"),
            TimeSlot(timeName: "День", starTime: "12:00", endTime: "18:00"),
            TimeSlot(timeName: "Вечер", starTime: "18:00", endTime: "00:00"),
            TimeSlot(timeName: "Ночь", starTime: "00:00", endTime: "06:00")
        ]
    }
}

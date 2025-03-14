//
//  Untitled.swift
//  ypTravel
//
//  Created by Олег Кор on 06.02.2025.
//
import Foundation

struct City: Identifiable, Hashable, Sendable {
    let id = UUID()
    var name: String
    let stations: [Station]
}

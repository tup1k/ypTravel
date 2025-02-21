//
//  Untitled.swift
//  ypTravel
//
//  Created by Олег Кор on 06.02.2025.
//
import Foundation

struct City: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let stations: [Station]
}

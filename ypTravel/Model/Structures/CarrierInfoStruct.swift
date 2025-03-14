//
//  CarrierInfoStruct.swift
//  ypTravel
//
//  Created by Олег Кор on 06.03.2025.
//
import Foundation

struct CarrierInfoStruct: Hashable, Identifiable, Sendable {
    let id = UUID()
    let carrierImage: String
    let carrierName: String
    let carrierMail: String
    let carrierPhone: String
}



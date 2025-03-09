//
//  CarrierInfoStruct.swift
//  ypTravel
//
//  Created by Олег Кор on 06.03.2025.
//
import Foundation

struct CarrierInfoStruct: Hashable, Identifiable {
    let id = UUID()
    let carrierImage: String
//    let carrierImage: URL?
    let carrierName: String
    let carrierMail: String
    let carrierPhone: String
}



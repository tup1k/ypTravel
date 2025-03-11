import SwiftUI

final class CommonData: ObservableObject {
    static let shared = CommonData()
    
    var commonCities: [City] = []
}


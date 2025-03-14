import Foundation

@MainActor
final class CarrierInfoViewModel: ObservableObject {
    var networkViewModel = DataNetworkService()
    @Published var carrierInfoList: CarrierInfoStruct = CarrierInfoStruct(carrierImage: "", carrierName: "", carrierMail: "", carrierPhone: "")
    
    func fetchCarrierInfo(carrierCode: String) async throws {
        let fetchedCarriers = try await networkViewModel.carrierInfo(code: carrierCode)
        DispatchQueue.main.async {
            self.carrierInfoList = fetchedCarriers
        }
    }
}





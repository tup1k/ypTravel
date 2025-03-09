import Foundation

@MainActor
final class CarrierInfoViewModel: ObservableObject {
    var networkViewModel = DataNetworkService()
    @Published var carrierList: CarrierInfoStruct
    
    init() {
        self.carrierList = CarrierInfoStruct(carrierImage: "", carrierName: "", carrierMail: "", carrierPhone: "")
        fetchCarrierInfo()
    }
    
    private func fetchCarrierInfo() {
            Task {
                let fetchedCarriers = await networkViewModel.carrierInfo(code: "112")
                DispatchQueue.main.async {
                    self.carrierList = fetchedCarriers
                }
            }
        }
}





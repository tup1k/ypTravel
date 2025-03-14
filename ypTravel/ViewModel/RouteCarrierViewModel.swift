import Foundation
import SwiftUI

@MainActor
final class RouteCarrierViewModel: ObservableObject {
    @Published var carrierList: [RouteCarrierStruct] = []
    @Published var filterArray: [String]
    @Published var filterIsSelected: Bool?
    @Published var isShowWithTransfers: Bool?
    @Published var isLoading: Bool = false
    
    private var networkViewModel = DataNetworkService()
    let isoFormatter = ISO8601DateFormatter()
   
    init() {
        self.filterArray = []
    }

    
    var carrierArray: [RouteCarrierStruct] {
        carrierList.filter { carrier in
            let isTransfered = (isShowWithTransfers ?? true) ? true : !carrier.transferInfo
            let timeFilter = filterArray.isEmpty || filterArray.contains { $0.contains(filterFunction(carrier: carrier)) }
            print(filterArray)
            let testTimeFilter = filterArray.contains { $0.contains(filterFunction(carrier: carrier)) }
            print(Int(carrier.routeStartTime.prefix(2)) ?? 0)
            print(timeFilter)
            return isTransfered && timeFilter
        }
    }
    
    /// Форматирование времени в ячейке
    private var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    /// Форматирование времени в ячейке
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
       }()
    
    
    func loadRoutes(codeOutput: String, codeInput: String) async throws {
        guard !isLoading else { return }
        isLoading = true
        
        do {
            let fetchedRoutes = try await networkViewModel.scheduleBetweenStations(fromStationCode: codeOutput, toStationCode: codeInput)
            
            for segment in fetchedRoutes.segments ?? [] {
                let start_time = timeFormatter.string(from: isoFormatter.date(from: segment.departure ?? "") ?? Date())
                let stop_time = timeFormatter.string(from: isoFormatter.date(from: segment.arrival ?? "") ?? Date())
                let routeDay = dateFormatter.string(from: isoFormatter.date(from: segment.departure ?? "") ?? Date())
                
                let newRoute = RouteCarrierStruct(
                    carrierImage: segment.thread?.carrier?.logo ?? "",
                    carrierName: segment.thread?.carrier?.title ?? "Test",
                    transferInfo: segment.has_transfers ?? false,
                    routeDate: routeDay,
                    routeStartTime: start_time,
                    routeEndTime: stop_time,
                    routeDuration: String(format: "%.f", Double(segment.duration ?? 0) / 3600),
                    carrierCode: String(segment.thread?.carrier?.code ?? 112),
                    carrierMail: segment.thread?.carrier?.email ?? "Электронная почта отсутстует",
                    carrierPhone: segment.thread?.carrier?.phone ?? "Номер телефона отсутствует"
                )
                carrierList.append(newRoute)
            }
            isLoading = false
        } catch {
            print("Ошибка загрузки маршрутов:\(error.localizedDescription)")
            isLoading = false
        }
    }
    
    func filterFunction(carrier: RouteCarrierStruct) -> String {
        guard let hour = Int(carrier.routeStartTime.prefix(2)) else {return "Ошибка конвертации времени"}
        
        switch hour {
        case 6..<12:
            return "Утро 06:00 - 12:00"
        case 12..<18:
            return "День 12:00 - 18:00"
        case 18..<24:
            return "Вечер 18:00 - 00:00"
        case 0..<6:
            return "Ночь 00:00 - 06:00"
        default:
            return "Вне диапазона"
        }
    }
}


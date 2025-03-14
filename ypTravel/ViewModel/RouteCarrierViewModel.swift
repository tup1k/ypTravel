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
            let isTransfered = isShowWithTransfers ?? true ? !carrier.transferInfo : true
            let timeFilter = filterArray.isEmpty || filterArray.contains { filterFunction(carrier: carrier).contains($0) }
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
        
        carrierList.removeAll()
        
        do {

            let fetchedRoutes = try await networkViewModel.scheduleBetweenStations(fromStationCode: codeOutput, toStationCode: codeInput)
            
            guard let segments = fetchedRoutes.segments, !segments.isEmpty else {
                       print("Нет данных о маршрутах.")
                       isLoading = false
                       return
                   }
              
            
            for segment in segments {
                let startTime = isoFormatter.date(from: segment.departure ?? "")
                let stopTime = isoFormatter.date(from: segment.arrival ?? "")
                
                let startFormatted = startTime.map { timeFormatter.string(from: $0) } ?? timeFormatter.string(from: Date())
                let stopFormatted = stopTime.map { timeFormatter.string(from: $0) } ?? timeFormatter.string(from: Date())
                
              
                let routeDay = startTime.map { dateFormatter.string(from: $0) } ?? dateFormatter.string(from: Date())
                
                let email = segment.thread?.carrier?.email
                let phone = segment.thread?.carrier?.phone
                
                let newRoute = RouteCarrierStruct(
                    carrierImage: segment.thread?.carrier?.logo ?? "",
                    carrierName: segment.thread?.carrier?.title ?? "Неизвестный перевозчик",
                    transferInfo: segment.has_transfers ?? false,
                    routeDate: routeDay,
                    routeStartTime: startFormatted,
                    routeEndTime: stopFormatted,
                    routeDuration: String(format: "%.f", Double(segment.duration ?? 0) / 3600),
                    carrierCode: String(segment.thread?.carrier?.code ?? 112),
                    carrierMail: (email?.isEmpty == false ? email : "Электронная почта отсутствует") ?? "Электронная почта отсутствует",
                    carrierPhone: (phone?.isEmpty == false ? phone : "Номер телефона отсутствует") ?? "Номер телефона отсутствует"
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


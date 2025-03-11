import SwiftUI

struct FindTheRouteTab: View {
    @EnvironmentObject private var navigationArray: NavigationModel
    @Binding var fromCity: City
    @Binding var fromStation: Station
    @Binding var toCity: City
    @Binding var toStation: Station
    @Binding var tabBarIsHidden: Bool
    
    var body: some View {
            ZStack {
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 0) {
                        FromToButton(buttonPlaceholder: "Откуда", cityName: fromCity.name, stationName: fromStation.name, isUp: true) {
                            navigationArray.push(.cityView(true))
                            tabBarIsHidden = true
                        }
                        
                        FromToButton(buttonPlaceholder: "Куда", cityName: toCity.name, stationName: toStation.name, isUp: false) {
                            navigationArray.push(.cityView(false))
                            tabBarIsHidden = true
                        }
                    }
                    .background(.ypWhiteUniversal)
                    .cornerRadius(20)
                    
                    Button(action: {swap(&fromStation, &toStation)}) {
                        Image("ReverseButton")
                            .resizable()
                            .frame(width: 36, height: 36)
                    }
                }
            }
            .padding(16)
            .background(.ypBlue)
            .cornerRadius(20)
            .padding(.horizontal, 16)
        }
    }

#Preview {
    NavigationStack {
        FindTheRouteTab(fromCity: .constant(City(name: "Москва", stations: [Station(name: "Курский вокзал", code: "")])), fromStation: .constant(Station(name: "Курский вокзал", code: "")), toCity: .constant(City(name: "Курск", stations: [Station(name: "Вокзал", code: "")])), toStation: .constant(Station(name: "Вокзал", code: "")), tabBarIsHidden: .constant(true))
            .environmentObject(NavigationModel())
    }
}

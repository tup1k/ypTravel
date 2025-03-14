import SwiftUI


struct RouteTimeSelectionView: View {
    @ObservedObject private var filterViewModel: RouteCarrierViewModel
    @Environment(\.dismiss) private var dismiss
    @Binding var isFiltered: Bool
    
    init(filterViewModel: RouteCarrierViewModel, isFiltered: Binding<Bool>) {
        self.filterViewModel = filterViewModel
        self._isFiltered = isFiltered
    }
    
    var isFilterActive: Bool {
        return !filterViewModel.filterArray.isEmpty || filterViewModel.isShowWithTransfers != nil
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    dismiss()
                    isFiltered = isFilterActive
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.ypBlack)
                        .font(.system(size: 22))
                        .padding(.leading, 8)
                }
                Spacer()
            }
            
            Text("Время отправления")
                .padding()
                .fontWeight(.bold)
                .font(.system(size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            CheckBoxView(filterViewModel: filterViewModel, filterText: "Утро 06:00 - 12:00")
            CheckBoxView(filterViewModel: filterViewModel, filterText: "День 12:00 - 18:00")
            CheckBoxView(filterViewModel: filterViewModel, filterText: "Вечер 18:00 - 00:00")
            CheckBoxView(filterViewModel: filterViewModel, filterText: "Ночь 00:00 - 06:00")
            
            Text("Подсказывать варианты с пересадками")
                .padding()
                .fontWeight(.bold)
                .font(.system(size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            RadioView(filterViewModel: filterViewModel, radioText: "Да", isShowWithTransfers: true)
            RadioView(filterViewModel: filterViewModel, radioText: "Нет", isShowWithTransfers: false)
            
            Spacer()
            
            Button(action: {
                dismiss()
                isFiltered = isFilterActive
            })
            {
                Text("Применить")
                    .frame(width: 343, height: 60)
                    .padding(.horizontal, 16)
                    .background(.ypBlue)
                    .foregroundColor(.ypWhiteUniversal)
                    .cornerRadius(16)
                    .font(.system(size: 17, weight: .bold))
                    .padding(.bottom, 24)
                    .disabled(isFilterActive)
                    .opacity(isFilterActive ? 1 : 0)
            }
            .frame(maxWidth: .infinity, alignment: .bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationBarBackButtonHidden(true)
        .background(.ypWhite)
        }
            
    }
    


struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RouteCarrierViewModel()
        return RouteTimeSelectionView(filterViewModel: viewModel, isFiltered: .constant(true))
    }
}

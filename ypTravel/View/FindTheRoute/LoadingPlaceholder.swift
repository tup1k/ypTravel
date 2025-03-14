import SwiftUI

struct LoadingPlaceholder: View {
    var body: some View {
        VStack {
            Text("Загрузка данных...")
                .font(.title)
                .foregroundColor(.ypBlack)
                .padding(.top, 20)
            ProgressView()
        }
    }
}

#Preview {
    LoadingPlaceholder()
}

import SwiftUI

struct StoryView: View {
    let story: LargeStory
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.ypBlackUniversal
                .ignoresSafeArea()
            Image(story.largeImage)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 40))
            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                Text(story.title)
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.ypWhiteUniversal)
                Text(story.description)
                    .font(.system(size: 20, weight: .regular))
                    .lineLimit(3)
                    .foregroundColor(.ypWhiteUniversal)
            }
            .padding(.init(top: 0, leading: 16, bottom: 40, trailing: 16))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    StoryView(story: LargeStory(largeImage: "MokStorie_1_2", title: "🎉 ⭐️ ❤️", description: "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text"))
}

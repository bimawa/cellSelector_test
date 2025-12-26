import SwiftUI

struct TabCell: View {
    let title: String
    let artist: String
    let index: Int

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("CellBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 120)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.7)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(artist)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
        }
        .frame(height: 120)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}

#Preview {
    TabCell(title: "Bohemian Rhapsody", artist: "Queen", index: 0)
        .padding()
}

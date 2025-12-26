import SwiftUI

struct TabCell: View {
    let title: String
    let artist: String
    let index: Int

    @State private var selectorStartX: CGFloat = 0
    @State private var selectorEndX: CGFloat = 0
    @State private var cellWidth: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                Image("CellBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 120)
                    .clipped()

                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(artist)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding()
                Selector(startX: $selectorStartX, endX: $selectorEndX, cellWidth: cellWidth)
            }
            .onAppear {
                cellWidth = geometry.size.width
            }
            .onChange(of: geometry.size.width) { _, newWidth in
                cellWidth = newWidth
            }
        }
        .frame(height: 120)
    }
}

#Preview {
    TabCell(title: "Bohemian Rhapsody", artist: "Queen", index: 0)
        .padding()
}

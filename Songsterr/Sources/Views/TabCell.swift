import SwiftUI

struct TabCell: View {
    let title: String
    let artist: String
    let index: Int
    let beatCount: Int

    @State private var startBeat: Int = 0
    @State private var endBeat: Int = 1
    @State private var beatPositions: [CGFloat] = []

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

                Selector(startBeat: $startBeat, endBeat: $endBeat, beatPositions: beatPositions)
            }
            .onAppear {
                beatPositions = calculateBeatPositions(width: geometry.size.width)
            }
            .onChange(of: geometry.size.width) { _, newWidth in
                beatPositions = calculateBeatPositions(width: newWidth)
            }
        }
        .frame(height: 120)
    }

    private func calculateBeatPositions(width: CGFloat) -> [CGFloat] {
        guard beatCount > 0 else { return [] }
        let stepWidth = width / CGFloat(beatCount)
        return (0...beatCount).map { CGFloat($0) * stepWidth }
    }
}

#Preview {
    TabCell(title: "Bohemian Rhapsody", artist: "Queen", index: 0, beatCount: 16)
        .padding()
}

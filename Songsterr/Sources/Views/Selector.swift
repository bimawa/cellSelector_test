import SwiftUI

struct Selector: View {
    @Binding var startBeat: Int
    @Binding var endBeat: Int
    let beatPositions: [CGFloat]

    private let handleWidth: CGFloat = 9
    private let handleHeight: CGFloat = 124

    var body: some View {
        GeometryReader { geometry in
            let startX = beatPositions.indices.contains(startBeat) ? beatPositions[startBeat] : 0
            let endX = beatPositions.indices.contains(endBeat) ? beatPositions[endBeat] : 0

            ZStack {
                let dragZoneOffset: CGFloat = 9
                if startBeat != endBeat {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(red: 118/255, green: 118/255, blue: 128/255).opacity(0.15))
                        .frame(width: max(dragZoneOffset, endX - startX - 2 * dragZoneOffset))
                        .position(x: startX + (endX - startX) / 2, y: geometry.size.height / 2)
                }

                Image("HandleLeft")
                    .resizable()
                    .frame(width: handleWidth, height: min(handleHeight, geometry.size.height))
                    .position(x: startX + handleWidth / 2, y: geometry.size.height / 2)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newBeat = closestBeat(to: value.location.x, in: beatPositions, maxBeat: endBeat - 1)
                                if newBeat != startBeat {
                                    startBeat = newBeat
                                }
                            }
                    )

                Image("HandleRight")
                    .resizable()
                    .frame(width: handleWidth, height: min(handleHeight, geometry.size.height))
                    .position(x: endX - handleWidth / 2, y: geometry.size.height / 2)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newBeat = closestBeat(to: value.location.x, in: beatPositions, minBeat: startBeat + 1)
                                if newBeat != endBeat {
                                    endBeat = newBeat
                                }
                            }
                    )
            }
        }
    }

    private func closestBeat(to x: CGFloat, in positions: [CGFloat], minBeat: Int = 0, maxBeat: Int? = nil) -> Int {
        let max = maxBeat ?? (positions.count - 1)
        var closest = minBeat
        var minDistance = abs(positions[minBeat] - x)

        for i in minBeat...max {
            let distance = abs(positions[i] - x)
            if distance < minDistance {
                minDistance = distance
                closest = i
            }
        }
        return closest
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var startBeat: Int = 2
        @State var endBeat: Int = 6

        let beats: [CGFloat] = stride(from: 0, to: 400, by: 40).map { $0 }

        var body: some View {
            VStack {
                Text("Start: \(startBeat), End: \(endBeat)")
                Selector(startBeat: $startBeat, endBeat: $endBeat, beatPositions: beats)
                    .frame(height: 120)
                    .background(Color.gray)
            }
        }
    }

    return PreviewWrapper()
}

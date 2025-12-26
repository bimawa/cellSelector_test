import SwiftUI

struct Selector: View {
    @Binding var startX: CGFloat
    @Binding var endX: CGFloat
    let cellWidth: CGFloat

    @State private var isDragging = false
    @State private var dragStartX: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.opacity(0.15)

                Rectangle()
                    .fill(Color.blue.opacity(0.3))
                    .frame(width: max(0, endX - startX))
                    .position(x: startX + (endX - startX) / 2, y: geometry.size.height / 2)
                    .overlay(
                        Rectangle()
                            .stroke(Color.blue, lineWidth: 2)
                            .frame(width: max(0, endX - startX))
                            .position(x: startX + (endX - startX) / 2, y: geometry.size.height / 2)
                    )

                Circle()
                    .fill(Color.white)
                    .frame(width: 20, height: 20)
                    .shadow(radius: 2)
                    .position(x: startX, y: geometry.size.height / 2)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newX = max(0, min(value.location.x, endX - 20))
                                startX = newX
                            }
                    )

                Circle()
                    .fill(Color.white)
                    .frame(width: 20, height: 20)
                    .shadow(radius: 2)
                    .position(x: endX, y: geometry.size.height / 2)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newX = max(startX + 20, min(value.location.x, cellWidth))
                                endX = newX
                            }
                    )
            }
        }
        .contentShape(Rectangle())
        .gesture(
            DragGesture()
                .onChanged { value in
                    if !isDragging {
                        isDragging = true
                        dragStartX = value.startLocation.x
                        startX = dragStartX
                        endX = dragStartX
                    }
                    endX = max(startX, min(value.location.x, cellWidth))
                }
                .onEnded { _ in
                    isDragging = false
                    if endX < startX {
                        let temp = startX
                        startX = endX
                        endX = temp
                    }
                }
        )
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var start: CGFloat = 50
        @State var end: CGFloat = 200

        var body: some View {
            Selector(startX: $start, endX: $end, cellWidth: 300)
                .frame(height: 120)
                .background(Color.gray)
        }
    }

    return PreviewWrapper()
}

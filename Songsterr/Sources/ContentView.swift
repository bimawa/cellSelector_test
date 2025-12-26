import SwiftUI

struct ContentView: View {
    let tabs = Tab.samples

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(Array(tabs.enumerated()), id: \.element.id) { index, tab in
                        TabCell(title: tab.title, artist: tab.artist, index: index, beatCount: tab.beatCount)
                    }
                }
                .padding()
            }
            .navigationTitle("Songsterr")
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    ContentView()
}

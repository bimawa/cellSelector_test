import Foundation

struct Tab: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let beatCount: Int
}

extension Tab {
    static let samples: [Tab] = [
        Tab(title: "Bohemian Rhapsody", artist: "Queen", beatCount: 16),
        Tab(title: "Stairway to Heaven", artist: "Led Zeppelin", beatCount: 12),
        Tab(title: "Hotel California", artist: "Eagles", beatCount: 16),
        Tab(title: "Sweet Child O' Mine", artist: "Guns N' Roses", beatCount: 8),
        Tab(title: "Smells Like Teen Spirit", artist: "Nirvana", beatCount: 16),
        Tab(title: "Wonderwall", artist: "Oasis", beatCount: 12),
        Tab(title: "Back in Black", artist: "AC/DC", beatCount: 8),
        Tab(title: "Nothing Else Matters", artist: "Metallica", beatCount: 16),
        Tab(title: "Comfortably Numb", artist: "Pink Floyd", beatCount: 12),
        Tab(title: "Free Bird", artist: "Lynyrd Skynyrd", beatCount: 16),
        Tab(title: "Enter Sandman", artist: "Metallica", beatCount: 8),
        Tab(title: "Eruption", artist: "Van Halen", beatCount: 16),
        Tab(title: "Crazy Train", artist: "Ozzy Osbourne", beatCount: 12),
        Tab(title: "Paranoid", artist: "Black Sabbath", beatCount: 8),
        Tab(title: "Purple Haze", artist: "Jimi Hendrix", beatCount: 16),
        Tab(title: "Smoke on the Water", artist: "Deep Purple", beatCount: 8),
        Tab(title: "Highway to Hell", artist: "AC/DC", beatCount: 12),
        Tab(title: "Master of Puppets", artist: "Metallica", beatCount: 16),
        Tab(title: "One", artist: "Metallica", beatCount: 16),
        Tab(title: "Thunderstruck", artist: "AC/DC", beatCount: 12)
    ]
}

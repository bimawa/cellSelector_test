import Foundation

struct Tab: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
}

extension Tab {
    static let samples: [Tab] = [
        Tab(title: "Bohemian Rhapsody", artist: "Queen"),
        Tab(title: "Stairway to Heaven", artist: "Led Zeppelin"),
        Tab(title: "Hotel California", artist: "Eagles"),
        Tab(title: "Sweet Child O' Mine", artist: "Guns N' Roses"),
        Tab(title: "Smells Like Teen Spirit", artist: "Nirvana"),
        Tab(title: "Wonderwall", artist: "Oasis"),
        Tab(title: "Back in Black", artist: "AC/DC"),
        Tab(title: "Nothing Else Matters", artist: "Metallica"),
        Tab(title: "Comfortably Numb", artist: "Pink Floyd"),
        Tab(title: "Free Bird", artist: "Lynyrd Skynyrd"),
        Tab(title: "Enter Sandman", artist: "Metallica"),
        Tab(title: "Eruption", artist: "Van Halen"),
        Tab(title: "Crazy Train", artist: "Ozzy Osbourne"),
        Tab(title: "Paranoid", artist: "Black Sabbath"),
        Tab(title: "Purple Haze", artist: "Jimi Hendrix"),
        Tab(title: "Smoke on the Water", artist: "Deep Purple"),
        Tab(title: "Highway to Hell", artist: "AC/DC"),
        Tab(title: "Master of Puppets", artist: "Metallica"),
        Tab(title: "One", artist: "Metallica"),
        Tab(title: "Thunderstruck", artist: "AC/DC")
    ]
}

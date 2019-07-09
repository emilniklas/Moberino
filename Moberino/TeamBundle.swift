import Cocoa

@objc
protocol TeamBundle {
    var name: String { get }
    var image: NSImage { get }
    var sound: NSSound { get }
    var suspense: TimeInterval { get }
}

class NewsTeamBundle: NSObject, TeamBundle {
    var name = "Moberino"
    var image = NSImage(named: "Ron")!
    var sound = NSSound(named: "news")!
    var suspense = TimeInterval(1.1)
}

class SportsTeamBundle: NSObject, TeamBundle {
    var name = "Sportmobben"
    var image = NSImage(named: "Sportmobben")!
    var sound = NSSound(named: "sports")!
    var suspense = TimeInterval(0)
}

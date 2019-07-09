//
//  TimerService.swift
//  Moberino
//
//  Created by Emil Persson on 2019-03-01.
//  Copyright © 2019 Emil Persson. All rights reserved.
//

import Foundation

protocol TimerEventsDelegate {
    func on(timeLeft: TimeInterval)
    func onStart()
    func onDone()
    func onTimeOut()
}

extension TimerEventsDelegate {
    func on(timeLeft: TimeInterval) {}
    func onStart() {}
    func onDone() {}
    func onTimeOut() {}
}

class TimerService: NSObject {
    var eventsDelegates: [TimerEventsDelegate]!
    var interval = TimeInterval(600)
    var timer: Timer?
    
    func stopTimer() {
        timer?.stop()
    }
    
    func startTimer() {
        let timer = Timer(of: interval)
        self.timer = timer
        
        for delegate in eventsDelegates {
            delegate.onStart()
        }
        
        timer.addListener { timeLeft in
            for delegate in self.eventsDelegates {
                delegate.on(timeLeft: timeLeft)
            }
        }
        
        timer.start { wasCancelled in
            if !wasCancelled {
                for delegate in self.eventsDelegates {
                    delegate.onTimeOut()
                }
            }
            for delegate in self.eventsDelegates {
                delegate.onDone()
            }
        }
    }
}

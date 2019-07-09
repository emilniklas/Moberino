//
//  Timer.swift
//  Moberino
//
//  Created by Emil Persson on 2019-03-01.
//  Copyright © 2019 Emil Persson. All rights reserved.
//

import Foundation

class Timer {
    let duration: TimeInterval
    var listeners: [(TimeInterval) -> Void] = []
    var isCancelled = false
    
    init(of duration: TimeInterval) {
        self.duration = duration
    }
    
    func addListener(_ listener: @escaping (TimeInterval) -> Void) {
        listeners.append(listener)
    }
    
    func stop() {
        isCancelled = true
    }
    
    func start(_ then: @escaping (_ wasCancelled: Bool) -> Void) {
        let queue = DispatchQueue(label: "timer")
        let syncQueue = OperationQueue.current!.underlyingQueue!
        
        queue.async {
            let startTime = Date()
            while true {
                Thread.sleep(forTimeInterval: TimeInterval(0.1))
                let interval = startTime.timeIntervalSinceNow + self.duration
                if interval < 0.1 || self.isCancelled {
                    break
                }
                syncQueue.sync {
                    for listener in self.listeners {
                        listener(interval)
                    }
                }
            }
            syncQueue.sync {
                then(self.isCancelled)
                self.isCancelled = false
            }
        }
    }
}

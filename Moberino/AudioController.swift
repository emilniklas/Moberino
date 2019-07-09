//
//  AudioController.swift
//  Moberino
//
//  Created by Emil Persson on 2019-03-01.
//  Copyright © 2019 Emil Persson. All rights reserved.
//

import Foundation
import AppKit

class AudioController: NSObject, TimerEventsDelegate {
    @IBOutlet weak var bundle: TeamBundle!
    
    func onTimeOut() {
        bundle.sound.play()
    }
}

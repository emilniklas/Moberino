//
//  AppDelegate.swift
//  Moberino
//
//  Created by Emil Persson on 2019-03-01.
//  Copyright © 2019 Emil Persson. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var pauseWindowController: PauseWindowController!
    @IBOutlet weak var statusMenuController: StatusMenuController!
    @IBOutlet weak var audioController: AudioController!
    @IBOutlet weak var timerService: TimerService!
    
    override func awakeFromNib() {
        timerService.eventsDelegates = [
            statusMenuController,
            audioController,
            pauseWindowController,
        ]
    }
}


//
//  StatusMenuController.swift
//  Moberino
//
//  Created by Emil Persson on 2019-03-01.
//  Copyright © 2019 Emil Persson. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject, TimerEventsDelegate {
    @IBOutlet weak var timerService: TimerService!
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var stopButton: NSMenuItem!
    @IBOutlet weak var preferencesButton: NSMenuItem!
    @IBOutlet weak var bundle: TeamBundle!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    override func awakeFromNib() {
        statusItem.menu = statusMenu
        statusItem.button?.title = bundle.name
        stopButton.isHidden = true
    }
    
    @IBAction func quitAction(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
    
    @IBAction func stopAction(_ sender: NSMenuItem) {
        timerService.stopTimer()
    }
    
    func onStart() {
        stopButton.isHidden = false
        preferencesButton.isHidden = true
    }

    func onDone() {
        statusItem.button?.title = bundle.name
        stopButton.isHidden = true
        preferencesButton.isHidden = false
    }
    
    func on(timeLeft: TimeInterval) {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        
        statusItem.button?.title = formatter.string(from: timeLeft.advanced(by: 1))!
    }
}

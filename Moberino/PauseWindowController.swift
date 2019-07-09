//
//  PauseWindowController.swift
//  Moberino
//
//  Created by Emil Persson on 2019-03-01.
//  Copyright © 2019 Emil Persson. All rights reserved.
//

import Cocoa

class PauseWindowController: NSObject, TimerEventsDelegate, NSAnimationDelegate {
    @IBOutlet weak var timerService: TimerService!
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var button: NSButton!
    @IBOutlet weak var label: NSTextField!
    @IBOutlet weak var imageView: NSImageView!
    
    @IBOutlet var preferencesView: NSView!
    @IBOutlet var pauseView: NSView!
    @IBOutlet weak var intervalField: NSTextField!
    @IBOutlet var bundle: TeamBundle!
    
    override func awakeFromNib() {
        window.level = .floating
        
        label.stringValue = bundle.name
        imageView.image = bundle.image
        reveal()
    }
    
    @IBAction func startClick(_ sender: Any) {
        window.close()
        
        timerService.startTimer()
    }
    
    @IBAction func updateInterval(_ sender: Any) {
        timerService.interval = TimeInterval(intervalField.intValue)
    }
    
    @IBAction func preferencesClick(_ sender: Any) {
        intervalField.intValue = Int32(timerService.interval)
        window.contentView = preferencesView
    }
    
    @IBAction func closePreferencesClick(_ sender: Any) {
        window.contentView = pauseView
    }
    
    func onStart() {
        button.title = "Starta"
        label.stringValue = bundle.name
    }
    
    func onDone() {
        reveal()
    }
    
    func onTimeOut() {
        Thread.sleep(forTimeInterval: bundle.suspense)
        button.title = "Fortsätt"
        label.stringValue = "Rotera!"
    }
    
    func reveal() {
        NSApp.activate(ignoringOtherApps: true)
        window.contentView = pauseView
        window.center()
        window.makeKeyAndOrderFront(nil)
    }
}

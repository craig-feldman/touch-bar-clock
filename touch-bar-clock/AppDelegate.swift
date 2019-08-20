//
//  AppDelegate.swift
//  Take a break
//
//  Created by Craig Feldman on 2019/08/11.
//  Copyright © 2019 Craig Feldman. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)
    lazy var menuBarStatusButton: NSStatusBarButton! = statusItem.button
    let touchBarButton = NSButton(title:"Hello", target:self, action: #selector(touchBarButtonTapped(_:)))
    let popover = NSPopover()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        menuBarStatusButton.action = #selector(togglePopover(_:))
        
        addToTouchBar(touchBarButton, "com.craigfeldman.touchBarButton")
        
        popover.contentViewController = SettingsViewController.freshController()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats:true);
    }
    
    var infoMessageElapsedDuration: TimeInterval = 1
    @objc func tick() -> Void {
        Data.elapsed += 1
        
        if !Data.displayingMessage {
            let colour = getColor(power: 1 - calculateElapsedPercentage())
            setButtonTextToCurrentDateTime(colour: colour)
        } else {
            infoMessageElapsedDuration += 1
            
            if (infoMessageElapsedDuration >= Data.infoMessageDuration) {
                Data.displayingMessage = false
                infoMessageElapsedDuration = 1
            }
        }
    }
    
    func getColor(power: Double) -> NSColor
    {
        let h: CGFloat = CGFloat(power * 0.4); // Hue (note 0.4 = Green)
        let s: CGFloat = 0.9; // Saturation
        let b: CGFloat = 0.9; // Brightness
        let colour = NSColor(
            hue: h,
            saturation: s,
            brightness: b,
            alpha: 1.0)
        
        return colour
    }
    
    func calculateElapsedPercentage() -> Double {
        let percent = min(Data.elapsed, Data.breakTime) / Data.breakTime
        return percent
    }
    
    func resetElapsed() {
        Data.elapsed = 0
        setButtonText(text: "Ok 👍")
    }
    
    @objc func touchBarButtonTapped(_ sender: NSButton)
    {
        resetElapsed()
    }
    
    @objc func togglePopover(_ sender: NSButton?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    func closePopover(sender: Any?) {
        popover.performClose(sender)
    }
    
    func setButtonTextToCurrentDateTime(colour: NSColor) {
        let currentDateTime = !Data.showElapsedTime ? dateFormatter.string(from: Date()) : Data.elapsed.stringFromTimeInterval();
        
        touchBarButton.attributedTitle = NSAttributedString(string: currentDateTime, attributes: [ NSAttributedString.Key.foregroundColor : colour])
        
        menuBarStatusButton?.attributedTitle = NSAttributedString(string: currentDateTime, attributes: [ NSAttributedString.Key.foregroundColor : colour])
    }
    
    func setButtonText(text: String) {
        Data.displayingMessage = true;
        touchBarButton.attributedTitle = NSAttributedString(string: text, attributes: [ NSAttributedString.Key.foregroundColor : Data.baseColour])
        menuBarStatusButton?.attributedTitle = NSAttributedString(string: text, attributes: [ NSAttributedString.Key.foregroundColor : Data.baseColour])
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}



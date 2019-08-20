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
    
    weak var window: MainWindowController!
    
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        if let menuBarStatusButton = statusItem.button {
            menuBarStatusButton.action = #selector(menuBarStatusButtonClicked(_:))
        }
    }
    
    
    @objc func menuBarStatusButtonClicked(_ sender: NSButton?) {
        print("Menu bar status button clicked")
        
        if window.window?.isVisible == true {
            window.close()
        } else  {
            window.showWindow(self)
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
}


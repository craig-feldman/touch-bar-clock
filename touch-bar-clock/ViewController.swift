//
//  ViewController.swift
//  Take a break
//
//  Created by Craig Feldman on 2019/08/11.
//  Copyright © 2019 Craig Feldman. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
   
    @IBOutlet weak var applyButton: NSButton!
    @IBOutlet weak var resetElapsedTimeButton: NSButton!
    @IBOutlet weak var breakTimeTextField: NSTextField!
    @IBOutlet weak var currentBreakTimeLabel: NSTextField!
    @IBOutlet weak var currentElapsedLabel: NSTextField!
    
    //var windowController: MainWindowController!
    var touchBarButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
//        windowController = (self.view.window?.windowController as! MainWindowController)
//
//        touchBarButton = windowController.touchBarButton
//        currentBreakTimeLabel.stringValue = windowController.breakTime.stringFromTimeInterval()
//        currentElapsedLabel.stringValue = windowController.elapsed.stringFromTimeInterval()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func applyButtonClicked(_ sender: NSButton) {
//        print("Apply clicked")
//        print(breakTimeTextField.stringValue)
//        let breakTime = TimeInterval(breakTimeTextField.stringValue)
//        if (breakTime != nil) {
//            windowController.breakTime = breakTime ?? windowController.breakTime
//
//            currentBreakTimeLabel.stringValue = windowController.breakTime.stringFromTimeInterval()
//            windowController.setButtonText(text: "OK")
//
//        } else {
//            windowController.setButtonText(text: "👎")
//        }
    }
    
    @IBAction func resetElapsedTimeButtonClicked(_ sender: NSButton) {
        // windowController.resetElapsed()
    }
}


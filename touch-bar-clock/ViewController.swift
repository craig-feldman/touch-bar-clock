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
    @IBOutlet weak var breakTimeTextField: NSTextField!
    
    var windowController: MainWindowController!
    var button: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
        windowController = self.view.window?.windowController as! MainWindowController
        button = windowController.button
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func applyButtonClicked(_ sender: NSButton) {
        print("Apply clicked")
        print(breakTimeTextField.stringValue)
        let breakTime = Double(breakTimeTextField.stringValue)
        if (breakTime != nil) {
            windowController.breakTime = breakTime ?? windowController.breakTime
        } else {
            windowController.setButtonText(text: "👎")
        }
        
        windowController.setButtonText(text: "OK")
    }
    
}


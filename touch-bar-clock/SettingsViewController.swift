//
//  SettingViewController.swift
//  touch-bar-clock
//
//  Created by Craig Feldman on 2019/08/20.
//  Copyright © 2019 Craig Feldman. All rights reserved.
//

import Cocoa

class SettingsViewController: NSViewController {
    
    @IBOutlet weak var applyButton: NSButton!
    @IBOutlet weak var resetElapsedTimeButton: NSButton!
    @IBOutlet weak var breakTimeTextField: NSTextField!
    @IBOutlet weak var showElapsedTimeCheckBox: NSButton!
    @IBOutlet weak var quitButton: NSButton!
    @IBOutlet weak var hideButton: NSButton!
    
    let appDelegate = NSApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        breakTimeTextField.placeholderString = Data.breakTime.stringFromTimeInterval()
    }
}

extension SettingsViewController {
    @IBAction func applyButtonClicked(_ sender: NSButton) {
        let newBreakTime = TimeInterval(breakTimeTextField.stringValue)
        if (newBreakTime != nil) {
            Data.breakTime = newBreakTime ?? Data.breakTime
            appDelegate.setButtonText(text: "OK")
        } else {
            appDelegate.setButtonText(text: "👎")
        }
        
        breakTimeTextField.placeholderString = Data.breakTime.stringFromTimeInterval()
        breakTimeTextField.stringValue = ""
    }
    
    @IBAction func resetElapsedTimeButtonClicked(_ sender: NSButton) {
        Data.elapsed = 0
    }
    
    @IBAction func showElapsedTime(_ sender: NSButton) {
        switch sender.state {
        case .on:
            Data.showElapsedTime = true
        default:
            Data.showElapsedTime = false
        }
    }
    
    @IBAction func hide(_ sender: NSButton) {
        appDelegate.closePopover(sender: sender)
    }
    
    @IBAction func quit(_ sender: NSButton) {
        NSApplication.shared.terminate(sender)
    }
}

extension SettingsViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> SettingsViewController {
        //1.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        //2.
        let identifier = NSStoryboard.SceneIdentifier("SettingsViewController")
        //3.
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? SettingsViewController else {
            fatalError("Why cant i find SettingsViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
}

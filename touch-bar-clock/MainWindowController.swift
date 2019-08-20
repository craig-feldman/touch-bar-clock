  //
  //  MainWindowController.swift
  //  Take a break
  //
  //  Created by Craig Feldman on 2019/08/11.
  //  Copyright © 2019 Craig Feldman. All rights reserved.
  //
  
  import Cocoa
  
  extension TimeInterval{
    
    func stringFromTimeInterval() -> String {
        
        let time = NSInteger(self)
        
        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = (time / 3600)
        
        //return String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
        var stringTime: String {
            if hours != 0 {
                return "\(hours)h \(minutes)m \(seconds)s"
            } else if minutes != 0 {
                return "\(minutes)m \(seconds)s"
            } else {
                return "\(seconds)s"
            }
        }
        
        return stringTime
    }
  }
  
  class MainWindowController: NSWindowController {
    
    let baseColour = NSColor.blue
    
    var menuBarButton: NSStatusBarButton!
    var touchBarButton: NSButton!
    
    let dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    var breakTime: TimeInterval = 600
    var elapsed: TimeInterval = 0
    
    let infoMessageDuration: TimeInterval = 2
    var displayingMessage = true
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        print("Loaded main window")
        
        let appDelegate = NSApplication.shared.delegate as! AppDelegate
        appDelegate.window = self
        menuBarButton = appDelegate.statusItem.button
        
        touchBarButton = NSButton(title:"Hello", target:self, action: #selector(touchBarButtonTapped(_:)))
        setButtonText(text: "Hello")
        
        dateFormatter.timeStyle = .short
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats:true);
        
        addToTouchBar(touchBarButton, "com.craigfeldman.touchBarButton")
        

    }
    
    @objc func touchBarButtonTapped(_ sender: NSButton)
    {
        print("tapped")
        
        let elapsedPercentage = calculateElapsedPercentage()
        print(elapsedPercentage)
        
        resetElapsed()
    }
    
    var infoMessageElapsedDuration: TimeInterval = 1
    
    @objc func tick() -> Void {
        elapsed += 1
        print(elapsed)
        
        if !displayingMessage {
            let colour = getColor(power: 1 - calculateElapsedPercentage())
            setButtonTextToCurrentDateTime(colour: colour)
        } else {
            infoMessageElapsedDuration += 1
            
            if (infoMessageElapsedDuration >= infoMessageDuration) {
                displayingMessage = false
                infoMessageElapsedDuration = 1
            }
        }
    }
    
    func calculateElapsedPercentage() -> Double {
        let percent = min(elapsed, breakTime) / breakTime
        return percent
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
    
    func resetElapsed() {
        elapsed = 0
        setButtonText(text: "Ok 👍")
    }
    
    func setButtonTextToCurrentDateTime(colour: NSColor) {
        let currentDateTime = dateFormatter.string(from: Date());

        touchBarButton.attributedTitle = NSAttributedString(string: currentDateTime, attributes: [ NSAttributedString.Key.foregroundColor : colour])
        
        menuBarButton?.attributedTitle = NSAttributedString(string: currentDateTime, attributes: [ NSAttributedString.Key.foregroundColor : colour])
    }
    
    func setButtonText(text: String) {
        displayingMessage = true;
        touchBarButton.attributedTitle = NSAttributedString(string: text, attributes: [ NSAttributedString.Key.foregroundColor : baseColour])
        menuBarButton?.attributedTitle = NSAttributedString(string: text, attributes: [ NSAttributedString.Key.foregroundColor : baseColour])
    }
  }
  

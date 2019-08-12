  //
  //  MainWindowController.swift
  //  Take a break
  //
  //  Created by Craig Feldman on 2019/08/11.
  //  Copyright © 2019 Craig Feldman. All rights reserved.
  //
  
  import Cocoa
  
  class MainWindowController: NSWindowController {
    
    var button: NSButton!
    let baseColour = NSColor.blue
    
    let dateFormatter = DateFormatter()
    
    var breakTime: Double = 10
    var elapsed: Double = 0
    
    var displayingMessage = true
    
    let infoMessageDuration = 2
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        print("Loaded")
        
        button = NSButton(title:"Hello", target:self, action: #selector(buttonAction(_:)))
        setButtonText(text: "Hello")
        
        dateFormatter.timeStyle = .short
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats:true);
        
        addToTouchBar(button, "com.craigfeldman.button")
    }
    
    @objc func buttonAction(_ sender: NSButton)
    {
        print("tapped")
        
        let elapsedPercentage = calculateElapsedPercentage()
        print(elapsedPercentage)
        
        resetElapsed()
        
        setButtonText(text: "👍", colour: baseColour)
    }
    
    var infoMessageElapsedDuration = 1
    @objc func tick() -> Void {
        elapsed += 1
        print(elapsed)
        
        if !displayingMessage {
            let time = dateFormatter.string(from: Date());
            let colour = getColor(power: 1 - calculateElapsedPercentage())
            
            setButtonText(text: time, colour: colour, isMessage: false)
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
    }
    
    func setButtonText(text: String, colour: NSColor, isMessage: Bool = true) {
        if isMessage {
            displayingMessage = true
        }
        
        button.attributedTitle = NSAttributedString(string: text, attributes: [ NSAttributedString.Key.foregroundColor : colour])
    }
    
    func setButtonText(text: String) {
        displayingMessage = true;
        button.attributedTitle = NSAttributedString(string: text, attributes: [ NSAttributedString.Key.foregroundColor : baseColour])
    }
    
  }
  

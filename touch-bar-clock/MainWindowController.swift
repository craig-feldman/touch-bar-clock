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
    
    let breakTime: Double = 10
    var elapsed: Double = 0
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        print("Loaded")
        
        button = NSButton(title:"Hello", target:self, action: #selector(buttonAction(_:)))
        button.attributedTitle = NSAttributedString(string: "Hello", attributes: [ NSAttributedString.Key.foregroundColor : baseColour])
        
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
        
        button.attributedTitle = NSAttributedString(string: "👍", attributes: [ NSAttributedString.Key.foregroundColor : baseColour])
    }
    
    @objc func tick() -> Void {
        elapsed += 1
        let time = dateFormatter.string(from: Date());
        let colour = getColor(power: 1 - calculateElapsedPercentage())
        
        button.attributedTitle = NSAttributedString(string: time, attributes: [ NSAttributedString.Key.foregroundColor : colour])
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
    
  }
  

//
//  Data.swift
//  touch-bar-clock
//
//  Created by Craig Feldman on 2019/08/20.
//  Copyright © 2019 Craig Feldman. All rights reserved.
//

import Foundation

struct Data {
    static let baseColour = NSColor.blue
    
    static var breakTime: TimeInterval = 600
    static var elapsed: TimeInterval = 0
    
    // The duration (in seconds) that an info message will be displayed
    static let infoMessageDuration: TimeInterval = 2
    static var displayingMessage = true
    
    // Whether or not to display the current time or elapsed time
    static var showElapsedTime = false
}

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

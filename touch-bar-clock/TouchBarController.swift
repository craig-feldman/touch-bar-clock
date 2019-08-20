////
////  TouchBarController.swift
////  Take a break
////
////  Created by Craig Feldman on 2019/08/12.
////  Copyright © 2019 Craig Feldman. All rights reserved.
////
//
//import Cocoa
//
//func applicationDidFinishLaunching(_ aNotification: Notification) {
//    TouchBarController.shared.setupControlStripPresence()
//}
//
//extension NSTouchBarItem.Identifier {
//    static let controlStripItem = NSTouchBarItem.Identifier("abc")
//}
//
//class TouchBarController: NSObject, NSTouchBarDelegate {
//    
//    static let shared = TouchBarController()
//    
//    let touchBar = NSTouchBar()
//    func setupControlStripPresence() {
//        DFRSystemModalShowsCloseBoxWhenFrontMost(false)
//        let item = NSCustomTouchBarItem(identifier: .controlStripItem)
//        item.view = NSButton(image: #imageLiteral(resourceName: "Strip"), target: self, action: #selector(presentTouchBar))
//        NSTouchBarItem.addSystemTrayItem(item)
//        updateControlStripPresence()
//    }
//    
//    func updateControlStripPresence() {
//        DFRElementSetControlStripPresenceForIdentifier(.controlStripItem, true)
//    }
//    
//    @objc private func presentTouchBar() {
//        if true {
//            updateControlStripPresence()
//            //presentSystemModal(touchBar, systemTrayItemIdentifier: .controlStripItem)
//        } else {
//            //
//        }
//    }
//    
//}

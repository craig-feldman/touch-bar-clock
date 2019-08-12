//
//  TouchBarController.m
//  Take a break
//
//  Created by Craig Feldman on 2019/08/12.
//  Copyright © 2019 Craig Feldman. All rights reserved.
//

#import "TouchBarController.h"

@interface TouchBarController ()

@end

@implementation TouchBarController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

// AppDelegate applicationDidFinishLaunching
func applicationDidFinishLaunching(_ aNotification: Notification) {
    TouchBarController.shared.setupControlStripPresence()
}

@end

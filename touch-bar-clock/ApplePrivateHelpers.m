//
//  ApplePrivateHelpers.m
//  Take a break
//
//  Created by Craig Feldman on 2019/08/12.
//  Copyright © 2019 Craig Feldman. All rights reserved.
//

@import Foundation;

#include "ApplePrivateHelpers.h"

// See: https://github.com/a2/touch-baer
extern void DFRSystemModalShowsCloseBoxWhenFrontMost(BOOL);
extern void DFRElementSetControlStripPresenceForIdentifier(NSString *string, BOOL enabled);

@interface NSTouchBarItem ()
+ (void)addSystemTrayItem:(NSTouchBarItem *)item;
@end

@interface NSTouchBar ()
+ (void)presentSystemModalFunctionBar:(NSTouchBar *)touchBar systemTrayItemIdentifier:(NSString *)identifier;
@end

void addToTouchBar(NSView *view, NSString *identifier) {
    if (@available(macOS 10.12.2, *)) {
        DFRSystemModalShowsCloseBoxWhenFrontMost(YES);
        
        NSCustomTouchBarItem *touchBarItem = [[NSCustomTouchBarItem alloc] initWithIdentifier:identifier];
        touchBarItem.view = view;
        [NSTouchBarItem addSystemTrayItem:touchBarItem];
        DFRElementSetControlStripPresenceForIdentifier(identifier, YES);
    } else {
        // FIXME: Fail!
    }
}

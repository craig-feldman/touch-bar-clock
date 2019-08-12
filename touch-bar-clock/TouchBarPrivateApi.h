//
//  TouchBarPrivateApi.h
//  Take a break
//
//  Created by Craig Feldman on 2019/08/12.
//  Copyright © 2019 Craig Feldman. All rights reserved.
//

#ifndef TouchBarPrivateApi_h
#define TouchBarPrivateApi_h


#endif /* TouchBarPrivateApi_h */

#import <AppKit/AppKit.h>


extern void DFRElementSetControlStripPresenceForIdentifier(NSTouchBarItemIdentifier, BOOL);
extern void DFRSystemModalShowsCloseBoxWhenFrontMost(BOOL);

@interface NSTouchBarItem (PrivateMethods)
+ (void)addSystemTrayItem:(NSTouchBarItem *)item;
+ (void)removeSystemTrayItem:(NSTouchBarItem *)item;
@end


@interface NSTouchBar (PrivateMethods)
+ (void)presentSystemModalFunctionBar:(NSTouchBar *)touchBar placement:(long long)placement systemTrayItemIdentifier:(NSTouchBarItemIdentifier)identifier;
+ (void)presentSystemModalFunctionBar:(NSTouchBar *)touchBar systemTrayItemIdentifier:(NSTouchBarItemIdentifier)identifier;
+ (void)dismissSystemModalFunctionBar:(NSTouchBar *)touchBar;
+ (void)minimizeSystemModalFunctionBar:(NSTouchBar *)touchBar;
@end

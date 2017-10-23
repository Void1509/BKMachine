//
//  BKAppDelegate.m
//  BKMachine
//
//  Created by Valeriy on 15.11.12.
//  Copyright (c) 2012 Valeriy. All rights reserved.
//

#import "BKAppDelegate.h"
#import "Defines.h"
#import "BKMem0010.h"

@implementation BKAppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
// Test //////////////
    BKMem0010 * mem = [[BKMem0010 alloc] init];

    [mem release];
    // Insert code here to initialize your application
}
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}
@end

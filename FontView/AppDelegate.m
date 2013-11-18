//
//  AppDelegate.m
//  FontView
//
//  Created by Sammy on 13-11-15.
//  Copyright (c) 2013年 sammy. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [super dealloc];
}






- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSArray *draggedTypeArray = [NSArray arrayWithObjects:NSFilenamesPboardType,NSURLPboardType, nil]; 
    [_window registerForDraggedTypes:draggedTypeArray];
    NSLog(@"registerForDraggedTypes");
    
   // [_window setWindowController:<#(NSWindowController *)#>]
}

@end

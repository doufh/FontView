//
//  MainWindow.h
//  FontView
//
//  Created by Sammy on 13-11-17.
//  Copyright (c) 2013年 sammy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainWindow : NSWindow
{
    IBOutlet NSButton       *pBtn;
    IBOutlet NSTextField    *pTextField;
}


- (NSString*) getFontNameByFilePath:(NSString*)pFontPath;

@end

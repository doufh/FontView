//
//  MainWindow.m
//  FontView
//
//  Created by Sammy on 13-11-17.
//  Copyright (c) 2013年 sammy. All rights reserved.
//

#import "MainWindow.h"

@implementation MainWindow
- (void)draggingExited:(id <NSDraggingInfo>)sender
{
    [NSCursor pop];
}

- (NSDragOperation)draggingUpdated:(id <NSDraggingInfo>)sender
{
    return [self draggingEntered:sender];
}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender
{
    return NSDragOperationCopy;
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender
{
	NSPasteboard *pboard;
	pboard = [sender draggingPasteboard];
	if ([[pboard types] containsObject:NSFilenamesPboardType])
	{
		NSArray *filenames = [pboard propertyListForType:NSFilenamesPboardType];
        NSLog(@"%@", [filenames objectAtIndex:0]);
       
		NSString* fontName = [self getFontNameByFilePath:[filenames objectAtIndex:0]];
        [pTextField setStringValue:fontName];
        
		return YES;
	}
	return NO;
}

-(IBAction)bntPress:(id)sender
{
    
    NSOpenPanel *pPanel = [NSOpenPanel openPanel];
    [pPanel setPrompt:[NSString stringWithUTF8String:"choose a font file"]];
    [pPanel beginSheetModalForWindow:self completionHandler: ^(NSInteger result)
     {
         if(result == NSFileHandlingPanelOKButton)
         {
             NSString *filePath = [[[pPanel URLs] objectAtIndex:0] path];
             NSString* fontName = [self getFontNameByFilePath:filePath];
             [pTextField setStringValue:fontName];
         }
     }];
}

- (NSString*) getFontNameByFilePath:(NSString*)pFontPath
{
    NSURL *url = [NSURL fileURLWithPath:pFontPath];
    
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL(( CFURLRef)url);
    if (fontDataProvider == NULL)
        return [NSString stringWithUTF8String:"invalid font type"];
    
    CGFontRef newFont = CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    if (newFont == NULL)
        return [NSString stringWithUTF8String:"invalid font type"];
    
    NSString *fontName = ( NSString *)CGFontCopyFullName(newFont);
    
    CGFontRelease(newFont);
    
    return fontName;
}

@end

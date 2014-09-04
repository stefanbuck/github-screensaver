//
//  GitHubScreensaverView.m
//  GitHubScreensaver
//
//  Created by Stefan Buck on 04/09/14.
//  Copyright (c) 2014 Stefan Buck. All rights reserved.
//

#import "GitHubScreensaverView.h"
#import <WebKit/WebKit.h>

@implementation GitHubScreensaverView

static NSString * const WebScreenSaverModuleName = @"com.stefanbuck.screensaver1";

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    
    if (self) {
        ScreenSaverDefaults *defaults;
        defaults = [ScreenSaverDefaults defaultsForModuleWithName:WebScreenSaverModuleName];
        
        [defaults registerDefaults:[NSDictionary dictionaryWithObjectsAndKeys:
                                    @"", @"username",
                                    nil]];
        
        NSString *url = [NSString stringWithFormat:@"https://github.com/%@", [defaults stringForKey:@"username"]];
        
		webView = [[WebView alloc] initWithFrame:[self bounds] frameName:nil groupName:nil];
        
		[webView setMainFrameURL:url];
		[self addSubview:webView];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return YES;
}

- (NSWindow*)configureSheet
{
    ScreenSaverDefaults *defaults;
    
    defaults = [ScreenSaverDefaults defaultsForModuleWithName:WebScreenSaverModuleName];
    
    if (!configSheet)
    {
        if (![NSBundle loadNibNamed:@"ConfigureSheet" owner:self])
        {
            NSLog( @"Failed to load configure sheet." );
            NSBeep();
        }
    }
    
    [urlField setStringValue:[defaults valueForKey:@"username"]];
    
    return configSheet;
}

- (IBAction)cancelClick:(id)sender
{
    [[NSApplication sharedApplication] endSheet:configSheet];
}

- (IBAction) okClick: (id)sender
{
    ScreenSaverDefaults *defaults;
    
    defaults = [ScreenSaverDefaults defaultsForModuleWithName:WebScreenSaverModuleName];
    
    [defaults setValue:[urlField stringValue] forKey:@"username"];
    
    [defaults synchronize];
    
    [[NSApplication sharedApplication] endSheet:configSheet];
}

@end

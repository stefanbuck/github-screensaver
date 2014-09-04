//
//  GitHubScreensaverView.h
//  GitHubScreensaver
//
//  Created by Stefan Buck on 04/09/14.
//  Copyright (c) 2014 Stefan Buck. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>
#import <WebKit/WebKit.h>

@interface GitHubScreensaverView : ScreenSaverView
{
	WebView *webView;
    IBOutlet id configSheet;
    IBOutlet NSTextField *urlField;
}

@end

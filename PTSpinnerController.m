//
//  PTSpinnerController.m
//
//  Created by Sergey Lenkov on 04.02.11.
//  Copyright 2011 Positive Team. All rights reserved.
//

#import "PTSpinnerController.h"

static PTSpinnerController *sharedInstance = nil;

@implementation PTSpinnerController

@synthesize titleLabel;
@synthesize activityView;
@synthesize text;

+ (PTSpinnerController *)sharedSpinner {
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[PTSpinnerController alloc] initWithNibName:@"PTSpinnerView" bundle:nil];
        }
    }
    
    return sharedInstance;
}

+ (PTSpinnerController *)spinnerControllerWithText:(NSString *)aText {
    PTSpinnerController *controller = [[[PTSpinnerController alloc] initWithNibName:@"PTSpinnerView" bundle:nil] autorelease];
    controller.text = aText;
    
    return controller;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    
    if (self) {
        self.title = @"";
    }
    
    return self;
}

- (void)dealloc {
    [titleLabel release];
    [activityView release];
    [text release];
    [super dealloc];
}

- (void)setText:(NSString *)newText {
    if (text != newText) {
        [text release];
        text = [newText copy];
    }
}

- (void)showInView:(UIView *)parentView {
    [parentView addSubview:self.view];
    self.view.center = parentView.center;
    
    titleLabel.text = text;
    [activityView startAnimating];
}

- (void)hide {
    titleLabel.text = @"";
    [activityView stopAnimating];
    
    [self.view removeFromSuperview];
}

@end

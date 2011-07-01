//
//  PTSpinnerController.m
//
//  Created by Sergey Lenkov on 04.02.11.
//  Copyright 2011 Positive Team. All rights reserved.
//

#import "PTSpinnerController.h"

static PTSpinnerController *sharedInstance = nil;

@implementation PTSpinnerController

@synthesize title;

+ (PTSpinnerController *)sharedSpinner {
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[PTSpinnerController alloc] initWithNibName:@"PTSpinnerView" bundle:nil];
        }
    }
    
    return sharedInstance;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    
    if (self) {
        self.title = @"";
    }
    
    return self;
}

- (void)dealloc {
    [title release];
    [super dealloc];
}

- (void)showInView:(UIView *)parentView {
    titleLabel.text = title;
    [activityView startAnimating];
    
    [parentView addSubview:self.view];
}

- (void)hide {
    titleLabel.text = @"";
    [activityView stopAnimating];
    
    [self.view removeFromSuperview];
}

@end

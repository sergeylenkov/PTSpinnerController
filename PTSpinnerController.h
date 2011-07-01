//
//  PTSpinnerController.h
//
//  Created by Sergey Lenkov on 04.02.11.
//  Copyright 2011 Positive Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PTSpinnerController : UIViewController {
    IBOutlet UILabel *titleLabel;
    IBOutlet UIActivityIndicatorView *activityView;
    NSString *title;
}

@property (nonatomic, copy) NSString *title;

+ (PTSpinnerController *)sharedSpinner;

- (void)showInView:(UIView *)parentView;
- (void)hide;

@end

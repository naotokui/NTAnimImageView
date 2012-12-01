//
//  NTViewController.h
//  NTAnimImageViewSample
//
//  Created by Nao Tokui on 12/1/12.
//  Copyright (c) 2012 Nao Tokui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTAnimImageView.h"

@interface NTViewController : UIViewController
{
    IBOutlet NTAnimImageView    *imageView;
}

- (IBAction) animateButtonTapped:(id)sender;
- (IBAction) animateWithFadeButtonTapped:(id)sender;

@end

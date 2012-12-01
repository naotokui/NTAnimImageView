//
//  NTAnimImageView.h
//  NTAnimImageViewSample
//
//  Created by Nao Tokui on 12/1/12.
//  Copyright (c) 2012 Nao Tokui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NTAnimImageView : UIImageView

@property BOOL  isAnimatingWithFade;
@property int   animationIndex;

- (void) startAnimatingWithFade;
- (void) stopAnimatingWithFade;

@end

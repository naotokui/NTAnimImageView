//
//  NTAnimImageView.m
//  NTAnimImageViewSample
//
//  Created by Nao Tokui on 12/1/12.
//  Copyright (c) 2012 Nao Tokui. All rights reserved.
//

#import "NTAnimImageView.h"
#import <QuartzCore/QuartzCore.h>

@interface NTAnimImageView()
@property (strong, nonatomic) NSTimer *animationTimer;
@end

@implementation NTAnimImageView

@synthesize animationIndex = _animationIndex;
@synthesize animationTimer  = _animationTimer;
@synthesize isAnimatingWithFade = _isAnimatingWithFade;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void) startAnimatingWithFade
{
    if (self.isAnimatingWithFade) [self stopAnimatingWithFade];
    
    int numImage  = MAX([self.animationImages count], 1);
    float animtionInterval = self.animationDuration / numImage;
    _animationTimer  =  [NSTimer scheduledTimerWithTimeInterval:animtionInterval target: self selector: @selector(animationTimerFired:) userInfo:nil repeats: YES];
    
    self.isAnimatingWithFade    = YES;
}

- (void) stopAnimatingWithFade
{
    [_animationTimer invalidate];
    _animationTimer     = nil;
    
    self.isAnimatingWithFade    = NO;
}

- (void) animationTimerFired: (NSTimer *)timer{
    if (_animationIndex >=0 && _animationIndex <[self.animationImages count]){
        UIImage *image          = [self.animationImages objectAtIndex: _animationIndex];
        if ([image isEqual:[NSNull null]]==NO && image != nil){
            self.image              = image;
            
            int numImage                = MAX([self.animationImages count], 1);
            float animtionInterval      = self.animationDuration / numImage;
            
            CATransition *transition    = [CATransition animation];
            transition.duration         = animtionInterval;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            transition.type = kCATransitionFade;
            
            [self.layer addAnimation:transition forKey:nil];
        }
    }
    
    _animationIndex  = (_animationIndex + 1)%[self.animationImages count];
}

@end

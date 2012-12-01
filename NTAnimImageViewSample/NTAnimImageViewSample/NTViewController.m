//
//  NTViewController.m
//  NTAnimImageViewSample
//
//  Created by Nao Tokui on 12/1/12.
//  Copyright (c) 2012 Nao Tokui. All rights reserved.
//

#import "NTViewController.h"

#define ANIMATION_DURATION_PER_IMAGE    1.0

@interface NTViewController ()

@end

@implementation NTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i < 5; i++){
        [array addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", i]]];
    }
    imageView.animationImages   = array;
    imageView.animationDuration = [array count] * ANIMATION_DURATION_PER_IMAGE;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) animateButtonTapped:(id)sender
{
    [imageView stopAnimatingWithFade];
    [imageView startAnimating];    
}

- (IBAction) animateWithFadeButtonTapped:(id)sender
{
    [imageView stopAnimating];
    [imageView startAnimatingWithFade];
}

@end

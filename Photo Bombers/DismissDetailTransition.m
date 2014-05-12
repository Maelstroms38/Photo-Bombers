//
//  DismissDetailTransition.m
//  Photo Bombers
//
//  Created by Michael Stromer on 5/5/14.
//  Copyright (c) 2014 Michael Stromer. All rights reserved.
//

#import "DismissDetailTransition.h"

@implementation DismissDetailTransition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *detail = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
 
    [UIView animateWithDuration:0.3 animations:^{
        detail.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        [detail.view removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

@end

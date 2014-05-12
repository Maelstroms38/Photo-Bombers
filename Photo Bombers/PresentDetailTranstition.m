//
//  PresentDetailTranstition.m
//  Photo Bombers
//
//  Created by Michael Stromer on 5/5/14.
//  Copyright (c) 2014 Michael Stromer. All rights reserved.
//

#import "PresentDetailTranstition.h"

@implementation PresentDetailTranstition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *detail = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    detail.view.alpha = 0.0;
    
    CGRect frame = containerView.bounds;
    frame.origin.y += 20.0;
    frame.size.height -= 20.0;
    // sets frame
    detail.view.frame = frame;
    [containerView addSubview:detail.view];
    // adds to containerView
    [UIView animateWithDuration:0.3 animations:^{
        detail.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}
@end

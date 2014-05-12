//
//  DetailViewController.m
//  Photo Bombers
//
//  Created by Michael Stromer on 5/5/14.
//  Copyright (c) 2014 Michael Stromer. All rights reserved.
//

#import "DetailViewController.h"
#import "PhotoController.h"
#import "MetaDataView.h"

@interface DetailViewController ()
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIDynamicAnimator *animator;
@property (nonatomic) MetadataView *metadataView;
@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.95];
    
    self.metadataView = [[MetadataView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 400.0f)];
	self.metadataView.alpha = 0.0f;
	self.metadataView.photo = self.photo;
	[self.view addSubview:self.metadataView];

    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, -320.0, 320.0f, 320.0f)];
    [self.view addSubview:self.imageView];
    
    [PhotoController imageForPhoto:self.photo size:@"standard_resolution" completion:^(UIImage *image) {
        self.imageView.image = image;
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
    [self.view addGestureRecognizer:tap];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
}
- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    CGPoint point = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.imageView snapToPoint:self.view.center]; [self.animator addBehavior:snap];
    // added snaps
    self.metadataView.center = point;
	[UIView animateWithDuration:0.5 delay:0.7 usingSpringWithDamping:0.8 initialSpringVelocity:1.0 options:kNilOptions animations:^{
		self.metadataView.alpha = 1.0f;
	} completion:nil];

}

- (void)close {
    [self.animator removeAllBehaviors];
    
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.imageView snapToPoint:CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.view.bounds) +180.0f)];
    [self.animator addBehavior:snap];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

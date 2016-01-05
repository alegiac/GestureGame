//
//  GGViewController.m
//  GestureGame
//
//  Created by Alessandro Giacomella on 1/5/16
//  Copyright (c) 2014 Alessandro Giacomella. All rights reserved.
//

#import "GGViewController.h"

@interface GGViewController ()

// Content and banner views
@property (nonatomic, weak) IBOutlet UIView *contentView;
@property (nonatomic, strong) ADBannerView *bannerView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *bottomConstraint;

@end


@implementation GGViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([ADBannerView instancesRespondToSelector:@selector(initWithAdType:)]) {
        _bannerView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
    } else {
        _bannerView = [[ADBannerView alloc] init];
    }
    self.bannerView.delegate = self;
    [self.view addSubview:self.bannerView];
    
}

-(void)viewDidLayoutSubviews
{
    [self layoutAnimated:[UIView areAnimationsEnabled]];
}


- (void)layoutAnimated:(BOOL)animated {
    CGRect contentFrame = self.view.bounds;
    
    // all we need to do is ask the banner for a size that fits into the layout area we are using
    CGSize sizeForBanner = [self.bannerView sizeThatFits:contentFrame.size];
    
    // compute the ad banner frame
    CGRect bannerFrame = self.bannerView.frame;
    if (self.bannerView.bannerLoaded) {
        
        // bring the ad into view
        contentFrame.size.height -= sizeForBanner.height;   // shrink down content frame to fit the banner below it
        bannerFrame.origin.y = contentFrame.size.height;
        bannerFrame.size.height = sizeForBanner.height;
        bannerFrame.size.width = sizeForBanner.width;
        
        // if the ad is available and loaded, shrink down the content frame to fit the banner below it,
        // we do this by modifying the vertical bottom constraint constant to equal the banner's height
        //
        NSLayoutConstraint *verticalBottomConstraint = self.bottomConstraint;
        verticalBottomConstraint.constant = sizeForBanner.height;
        [self.view layoutSubviews];
        
    }
    else {
        // hide the banner off screen further off the bottom
        bannerFrame.origin.y = contentFrame.size.height;
    }
    
    [UIView animateWithDuration:animated ? 0.25 : 0.0 animations:^{
        [self.contentView layoutIfNeeded];
        self.bannerView.frame = bannerFrame;
    }];
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [self layoutAnimated:YES];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"didFailToReceiveAdWithError %@", error);
    [self layoutAnimated:YES];
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave {
    return YES;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner {
}



@end

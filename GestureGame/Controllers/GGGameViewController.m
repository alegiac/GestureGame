//
//  GGGameViewController.m
//  GestureGame
//
//  Created by Alessandro Giacomella on 08/01/16.
//  Copyright © 2016 Alessandro Giacomella. All rights reserved.
//

#import "GGGameViewController.h"

@interface GGGameViewController ()

@end


@implementation GGGameViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *Swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeRecognizer:)];
    Swipe.direction = (UISwipeGestureRecognizerDirectionLeft |
                       UISwipeGestureRecognizerDirectionRight |
                       UISwipeGestureRecognizerDirectionDown |
                       UISwipeGestureRecognizerDirectionUp);
    
    
}


- (void) SwipeRecognizer:(UISwipeGestureRecognizer *)sender {
    if ( sender.direction | UISwipeGestureRecognizerDirectionLeft )
        NSLog(@" *** SWIPE LEFT ***");
    if ( sender.direction | UISwipeGestureRecognizerDirectionRight )
        NSLog(@" *** SWIPE RIGHT ***");
    if ( sender.direction | UISwipeGestureRecognizerDirectionDown )
        NSLog(@" *** SWIPE DOWN ***");
    if ( sender.direction | UISwipeGestureRecognizerDirectionUp )
        NSLog(@" *** SWIPE UP ***");
}

@end

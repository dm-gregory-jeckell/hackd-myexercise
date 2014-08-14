//
//  LSViewController.m
//  myplate
//
//  Created by Greg Jeckell on 8/13/14.
//  Copyright (c) 2014 livestrong. All rights reserved.
//

#import "LSViewController.h"

@interface LSViewController ()

@end

@implementation LSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//	[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
//    NSLog(@"view did load");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openApp:(id)sender
{
    NSURL* url = [NSURL URLWithString:@"myexercise://http:www.myexercise.com"];
    [[UIApplication sharedApplication] openURL:url];
}

@end

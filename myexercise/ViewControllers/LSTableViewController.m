//
//  LSTableViewController.m
//  myexercise
//
//  Created by Greg Jeckell on 8/14/14.
//  Copyright (c) 2014 livestrong. All rights reserved.
//

#import "LSTableViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "LSViewController.h"
#import "LSTableViewCell.h"

@interface LSTableViewController ()
@end

@implementation LSTableViewController

#pragma mark - UIVIewController Overrides
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableData = @[
                       @{@"title" : @"The Demand Media Circuit",
                         @"ups" : @"898",
                         @"downs" : @"20",
                         @"img" : @"http://www.demandmedia.com/wordpress/wp-content/themes/demand2013/images/logo-demand-media.png"
                         },
                       @{@"title" : @"I Want to Pump YOU Up",
                         @"ups" : @"777",
                         @"downs" : @"94",
                         @"img" : @"http://cdn.rsvlts.com/wp-content/uploads/2012/08/Arnold-Schwarzenegger-Young-Photos-29.jpg"
                         },
                       @{@"title" : @"Messer Madness",
                         @"ups" : @"643",
                         @"downs" : @"122",
                         @"img" : @"http://i.imgur.com/kDHKnZk.jpg"
                         },
                       @{@"title" : @"Get Jacked with J",
                         @"ups" : @"600",
                         @"downs" : @"100",
                         @"img" : @"http://i.imgur.com/ZTXXD9N.jpg"
                         },
                       @{@"title" : @"Zuma Strength",
                         @"ups" : @"249",
                         @"downs" : @"99",
                         @"img" : @"http://media.tumblr.com/tumblr_kslkhsqB411qzcitt.jpg"
                         },
                       @{@"title" : @"Superman",
                         @"ups" : @"125",
                         @"downs" : @"40",
                         @"img" : @"http://www.thinksnaps.com/wp-content/uploads/2014/07/02-superman-75-shuster-first-appearance.jpg"
                         },
                       @{@"title" : @"Bale Clean",
                         @"ups" : @"99",
                         @"downs" : @"99",
                         @"img" : @"http://classic-horror.com/files/images/apcap450.jpg"
                         },
                       @{@"title" : @"Pure Power Push Plan",
                         @"ups" : @"80",
                         @"downs" : @"80",
                         @"img" : @"http://martywolff.cdn3.mirahost.com/public/uploads/content/10/turtle-facial.jpg"
                         },
                       ];
    self.featuredObject = @{@"title" : @"Equinox Set", @"img" : @"http://fashionights.com/wp-content/uploads/2013/09/ad_Equinox.jpg" };
    [self setupFeaturedObject];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playListCell" forIndexPath:indexPath];
    NSDictionary* data = [self.tableData objectAtIndex:indexPath.row];
    [cell.titleLabel setText:[data objectForKey:@"title"]];
    [cell.upsLabel setText:[data objectForKey:@"ups"]];
    [cell.downsLabel setText:[data objectForKey:@"downs"]];
    [cell.img setImageWithURL:[NSURL URLWithString:[data objectForKey:@"img"]]];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    LSTableViewCell* cell = sender;
    if ([segue.identifier isEqualToString:@"LSViewControllerSegue"]) {
        LSViewController* controller = segue.destinationViewController;
        controller.title = cell.titleLabel.text;
        controller.navImage.image = cell.img.image;
    }
}


#pragma mark - Private Methods
- (void)setGradientOnImageView:(UIImageView*)imgView fromColor:(UIColor*)startColor toColor:(UIColor*)endColor
{
    if (![imgView.layer.sublayers count]) {
        CAGradientLayer* gradient = [CAGradientLayer layer];
        gradient.frame = imgView.bounds;
        gradient.colors = @[(id)startColor.CGColor,
                            (id)endColor.CGColor];
        [imgView.layer insertSublayer:gradient atIndex:0];
    }
}

- (void)setupFeaturedObject
{
    [self.featuredImage setImageWithURL:[NSURL URLWithString:[self.featuredObject objectForKey:@"img"]]];
    UIColor* startColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    UIColor* endColor = [UIColor clearColor];
    [self setGradientOnImageView:self.featuredImage fromColor:endColor toColor:startColor];
    
    [self.featuredTitle setText:[self.featuredObject objectForKey:@"title"]];
}

@end

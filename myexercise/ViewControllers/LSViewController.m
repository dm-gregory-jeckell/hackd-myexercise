//
//  LSViewController.m
//  myexercise
//
//  Created by Greg Jeckell on 8/14/14.
//  Copyright (c) 2014 livestrong. All rights reserved.
//

#import "LSViewController.h"
#import "LSTableViewCell.h"
#import <FLAnimatedImage.h>
#import <UIImageView+AFNetworking.h>

@interface LSViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView* tableView;
@property (nonatomic, strong) NSArray* tableData;
@end

@implementation LSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableData = @[
                       @{@"title" : @"Burpees",
                         @"sets" : @"1 x 20",
                         @"img" : @"a"
                         },
                       @{@"title" : @"100 Yard Dash",
                         @"sets" : @"2 x 30",
                         @"img" : @"b"
                         },
                       @{@"title" : @"Mountain Climbers",
                         @"sets" : @"3 x 20",
                         @"img" : @"c"
                         },
                       @{@"title" : @"Jump Rope",
                         @"sets" : @"5 x 25",
                         @"img" : @"d"
                         },
                       @{@"title" : @"Jumping Jacks",
                         @"sets" : @"5 x 20",
                         @"img" : @"e"
                         },
                       ];
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
    LSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"workCell" forIndexPath:indexPath];
    NSDictionary* data = [self.tableData objectAtIndex:indexPath.row];
    [cell.titleLabel setText:[data objectForKey:@"title"]];
    [cell.subTitleLebel setText:[data objectForKey:@"sets"]];
    
    
    NSString* fileName = [data objectForKey:@"img"];
    NSBundle* bundle = [NSBundle bundleForClass:[self class]];
    NSString* filePath = [bundle pathForResource:fileName ofType:@"gif"];
    NSData* imgData = [NSData dataWithContentsOfFile:filePath];
    FLAnimatedImage* image = [[FLAnimatedImage alloc] initWithAnimatedGIFData:imgData];
    [cell.animatedImage setAnimatedImage:image];
    
    return cell;
}


@end

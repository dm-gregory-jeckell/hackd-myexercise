//
//  LSTableViewController.h
//  myexercise
//
//  Created by Greg Jeckell on 8/14/14.
//  Copyright (c) 2014 livestrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSTableViewController : UITableViewController
@property (nonatomic, strong) IBOutlet UIView* featuredContainer;
@property (nonatomic, strong) IBOutlet UIImageView* featuredImage;
@property (nonatomic, strong) IBOutlet UILabel* featuredTitle;
@end

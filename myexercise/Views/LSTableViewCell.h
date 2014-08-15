//
//  LSTableViewCell.h
//  myexercise
//
//  Created by Greg Jeckell on 8/14/14.
//  Copyright (c) 2014 livestrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIImageView* img;
@property (nonatomic, strong) IBOutlet UILabel* titleLabel;
@property (nonatomic, strong) IBOutlet UILabel* upsLabel;
@property (nonatomic, strong) IBOutlet UILabel* downsLabel;
@end

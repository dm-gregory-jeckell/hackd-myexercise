//
//  LSTableViewExpandableCell.h
//  myexercise
//
//  Created by Greg Jeckell on 8/14/14.
//  Copyright (c) 2014 livestrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSTableViewExpandableCell;
@protocol LSTableViewExpandableCellDelegate <NSObject>
@optional
- (void)sectionHeaderView:(LSTableViewExpandableCell *)sectionHeaderView sectionOpened:(NSInteger)section;
- (void)sectionHeaderView:(LSTableViewExpandableCell *)sectionHeaderView sectionClosed:(NSInteger)section;
- (void)sectionHeaderView:(LSTableViewExpandableCell *)sectionHeaderView sectionSelected:(NSInteger)section;
@end

@interface LSTableViewExpandableCell : UITableViewCell
@property (nonatomic, weak) IBOutlet id <LSTableViewExpandableCellDelegate> delegate;
@property (nonatomic, strong) IBOutlet UIButton* toggleButton;
@property (nonatomic) NSInteger section;

-(void)toggleOpenWithUserAction:(BOOL)userAction;
@end

//
//  LSTableViewExpandableCell.m
//  myexercise
//
//  Created by Greg Jeckell on 8/14/14.
//  Copyright (c) 2014 livestrong. All rights reserved.
//

#import "LSTableViewExpandableCell.h"

@implementation LSTableViewExpandableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)toggleOpen:(id)sender
{
    [self toggleOpenWithUserAction:YES];
}

-(void)toggleOpenWithUserAction:(BOOL)userAction
{
    // toggle the disclosure button state
    self.toggleButton.selected = !self.toggleButton.selected;

    // if this was a user action, send the delegate the appropriate message
    if (userAction) {
        if (self.toggleButton.selected) {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionOpened:)]) {
                [self.delegate sectionHeaderView:self sectionOpened:self.section];
            }
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionSelected:)]) {
                [self.delegate sectionHeaderView:self sectionSelected:self.section];
            }
        }
        else {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionClosed:)]) {
                [self.delegate sectionHeaderView:self sectionClosed:self.section];
            }
        }
    }
}

@end

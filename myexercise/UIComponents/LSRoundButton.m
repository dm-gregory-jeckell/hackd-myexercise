//
//  LSRoundButton.m
//  myexercise
//
//  Created by Greg Jeckell on 8/14/14.
//  Copyright (c) 2014 livestrong. All rights reserved.
//

#import "LSRoundButton.h"

@implementation LSRoundButton

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.layer.borderColor = self.tintColor.CGColor;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.bounds.size.width / 2.0;
    }
    return self;
}

@end

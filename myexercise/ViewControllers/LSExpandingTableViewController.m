//
//  LSExpandingTableViewController.m
//  myexercise
//
//  Created by Greg Jeckell on 8/14/14.
//  Copyright (c) 2014 livestrong. All rights reserved.
//

#import "LSExpandingTableViewController.h"
#import "LSTableViewExpandableCell.h"

@interface LSExpandingTableViewController () <LSTableViewExpandableCellDelegate>
@property (strong, nonatomic) NSArray* tableData;
@end

@implementation LSExpandingTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray* intensityRow = @[@"Low", @"Medium", @"High"];
    NSArray* durationRow = @[@"15 Minutes", @"30 Minutes", @"60 Minutes"];
    NSArray* bodyRow = @[@"Chest", @"Back", @"Arms", @"Legs", @"Butt", @"Abs", @"Cardio"];
    NSArray* equipmentRow = @[@"Gym", @"Outdoor", @"Free Weights", @"Office"];
    NSArray* fitnessRow = @[@"Weight Loss", @"Firm & Tone", @"Increase Strength"];
    self.tableData = @[
                       @{@"title" : @"Intensity", @"rows" : intensityRow},
                       @{@"title" : @"Duration", @"rows" : durationRow},
                       @{@"title" : @"Body", @"rows" : bodyRow},
                       @{@"title" : @"Equipment", @"rows" : equipmentRow},
                       @{@"title" : @"Fitness Goal", @"rows" : fitnessRow}
                       ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.tableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[self.tableData objectAtIndex:section] objectForKey:@"rows"] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}

#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LSTableViewExpandableCell* sectionCell = [tableView dequeueReusableCellWithIdentifier:@"sectionCell"];
    NSString* title = [[self.tableData objectAtIndex:section] objectForKey:@"title"];
    [sectionCell.toggleButton setTitle:title forState:UIControlStateNormal];
    [sectionCell setSection:section];
    
    return sectionCell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"defaultCell" forIndexPath:indexPath];
    NSArray* sectionData = [[self.tableData objectAtIndex:indexPath.section] objectForKey:@"rows"];
    [[cell textLabel] setText:[sectionData objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}

#pragma mark - SectionHeaderViewDelegate
- (void)sectionHeaderView:(LSTableViewExpandableCell *)sectionHeaderView sectionOpened:(NSInteger)sectionOpened
{

}

- (void)sectionHeaderView:(LSTableViewExpandableCell *)sectionHeaderView sectionClosed:(NSInteger)sectionClosed
{

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end

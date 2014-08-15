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


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

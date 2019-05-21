//
//  HAJEntryListTableViewController.m
//  Journal-C
//
//  Created by Haley Jones on 5/20/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

#import "HAJEntryListTableViewController.h"
#import "HAJEntryController.h"
#import "HAJEntry.h"
#import "HAJEntryDetailViewController.h"

@interface HAJEntryListTableViewController ()

@end

@implementation HAJEntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:true];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[HAJEntryController shared]entries]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    HAJEntry* cellEntry = [[[HAJEntryController shared]entries]objectAtIndex:indexPath.row];
    cell.textLabel.text = cellEntry.title;
    return cell;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        HAJEntry *entry = [[[HAJEntryController shared]entries]objectAtIndex:indexPath.row];
        [[HAJEntryController shared]removeEntry:entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:(@"toExistingEntry")]){
        NSIndexPath *index = self.tableView.indexPathForSelectedRow;
        HAJEntryDetailViewController *destinVC = [segue destinationViewController];
        HAJEntry *passEntry = [[[HAJEntryController shared]entries]objectAtIndex:index.row];
        destinVC.entry = passEntry;
    }
}


@end

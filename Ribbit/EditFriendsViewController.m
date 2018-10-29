//
//  EditFriendsViewController.m
//  Ribbit
//
//  Copyright (c) 2013 Treehouse. All rights reserved.
//

#import "EditFriendsViewController.h"
#import "User.h"
#import "App.h"

@interface EditFriendsViewController ()

@end

@implementation EditFriendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    [self.tableView reloadData];
  
    self.currentUser = [User currentUser];
    // alloc and init nameOfTheSelectedFirends
    self.nameOfTheSelectedFirends = [[NSMutableArray alloc] init];
}

- (NSArray *)allUsers {
  return [[App currentApp] allUsers];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.allUsers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    User *user = [self.allUsers objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    if ([self isFriend:user]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  
    User *user = [self.allUsers objectAtIndex:indexPath.row];
    
    if ([self isFriend:user]) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [self.currentUser removeFriend:user];
        [self.tableView reloadData];
        NSLog(@"already friends");
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        NSLog(@"Adding friends");
        
        [self.nameOfTheSelectedFirends addObject:user.username];
        
//        if (user.username != ) {
//
//        }
        
        [self.currentUser addFriend:user];
    }    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    User *user = [self.allUsers objectAtIndex:indexPath.row];
   
    if ([self isFriend:user]) {
        NSLog(@"hitting didDeselectRow branch to check existing freinds --- already friends");
        [self.currentUser removeFriend:user];
        // I want to get rid of the checkmarck here but It does not work
        cell.accessoryType = UITableViewCellAccessoryNone;
        [self.tableView reloadData];
    }
    
}

#pragma mark - Helper methods
// Aletred the body of the function to work with array of names
- (BOOL)isFriend:(User *)user {
  return [self.nameOfTheSelectedFirends containsObject:user.username];
}

@end

//
//  EditFriendsViewController.h
//  Ribbit
//
//  Copyright (c) 2013 Treehouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

@interface EditFriendsViewController : UITableViewController

@property (nonatomic, strong) User *currentUser;

// array to hold the names of friends
@property (nonatomic, strong) NSMutableArray *nameOfTheSelectedFirends;

- (BOOL)isFriend:(User *)user;

@end

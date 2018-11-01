//
//  InboxViewController.h
//  Ribbit
//
//  Copyright (c) 2013 Treehouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

@class Message;

@interface InboxViewController : UITableViewController

@property (nonatomic, strong) Message *selectedMessage;
@property (nonatomic, strong) AVPlayer *moviePlayer;

- (IBAction)logout:(id)sender;

@end

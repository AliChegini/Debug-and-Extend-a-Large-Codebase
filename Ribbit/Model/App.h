//
//  App.h
//  Ribbit
//
//  Created by Amit Bijlani on 9/6/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Message;

@interface App : NSObject

+ (instancetype) currentApp;
- (void) addMessage:(Message*)message;
- (void) deleteMessage:(Message*)message;
- (NSArray *) messages;
- (NSArray *) allUsers;

@end

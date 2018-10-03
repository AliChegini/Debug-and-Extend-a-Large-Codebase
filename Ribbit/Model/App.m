//
//  App.m
//  Ribbit
//
//  Created by Amit Bijlani on 9/6/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import "App.h"
#import "Message.h"

@interface App()

@property (strong, nonatomic) NSMutableArray *messagesMutable;

@end

@implementation App

+ (instancetype) currentApp {
  static App *sharedApp = nil;
  
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedApp = [[self alloc] init];
    sharedApp.messagesMutable = [NSMutableArray array];
  });
  
  return sharedApp;
}

- (void) addMessage:(Message*)message {
  [self.messagesMutable addObject:message];
}

- (void) deleteMessage:(Message*)message {
  [self.messagesMutable removeObject:message];
}

- (NSArray*)messages {
  return self.messagesMutable;
}

- (NSArray *)allUsers {
  return  @[ [User userWithUsername:@"John"],
             [User userWithUsername:@"Andrew"],
             [User userWithUsername:@"Ben"],
             [User userWithUsername:@"Pasan"],
             [User userWithUsername:@"Amit"],
             [User userWithUsername:@"Craig"],
             [User userWithUsername:@"Alena"]];
}


@end

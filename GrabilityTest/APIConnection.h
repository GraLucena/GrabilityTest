//
//  APIConnection.h
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/5/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "AFHTTPSessionManager.h"

typedef void (^FetchAppsCompletionBlock)(NSMutableArray *apps, NSError *error);

@interface APIConnection : AFHTTPSessionManager

@property (strong, nonatomic) NSArray* apps;

+ (instancetype)sharedInstance;

- (void)fetchApps:(FetchAppsCompletionBlock)completionBlock;

@end

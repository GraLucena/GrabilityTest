//
//  APIConnection.m
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/5/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "APIConnection.h"
#import <AFNetworkActivityIndicatorManager.h>
#import "entryModel.h"

static NSString * const BaseUrl = @"https://itunes.apple.com/";

@implementation APIConnection

+ (instancetype)sharedInstance {
    static APIConnection *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Network activity indicator manager setup
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        
        // Session configuration setup
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024     // 10MB. memory cache
                                                          diskCapacity:50 * 1024 * 1024     // 50MB. on disk cache
                                                              diskPath:nil];
        
        sessionConfiguration.URLCache = cache;
        sessionConfiguration.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
        
        // Initialize the session
        _sharedInstance = [[APIConnection alloc] initWithBaseURL:[NSURL URLWithString:BaseUrl] sessionConfiguration:sessionConfiguration];
    });
    
    return _sharedInstance;
}

- (instancetype)initWithBaseURL:(NSURL *)url sessionConfiguration:(NSURLSessionConfiguration *)configuration
{
    self = [super initWithBaseURL:url sessionConfiguration:configuration];
    if (!self) return nil;
    // Reachability setup
    [self.reachabilityManager startMonitoring];
    
    return self;
}


#pragma mark - Popular Shots fetching
- (void)fetchApps:(FetchAppsCompletionBlock)completionBlock
{
    NSString *path = @"us/rss/topfreeapplications/limit=20/json";
    
    [self GET:path parameters:nil progress:^(NSProgress * _Nonnull uploadProgress){
    
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        NSMutableArray *apps = [[NSMutableArray alloc] initWithCapacity:[responseObject[@"feed"][@"entry"] count]];
        for (NSDictionary *JSONAppsData in responseObject[@"feed"][@"entry"]) {
             entryModel *app = [MTLJSONAdapter modelOfClass:[entryModel class] fromJSONDictionary:JSONAppsData error:nil];
            
            if (app) [apps addObject:app];
        }
        
         completionBlock(apps, nil);

    }
      failure:^(NSURLSessionDataTask *task, NSError *error) {
          completionBlock(nil, error);
      }];
}



@end

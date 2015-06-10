//
//  MusicAPI.m
//  MusicTestApp
//
//  Created by Artem on 10/06/15.
//  Copyright (c) 2015 Artem. All rights reserved.
//

#import "MusicAPI.h"

NSString* musicBaseURL = @"http://api.content.mts.intech-global.com/public/marketplaces/10/tags/12/melodies";

static MusicAPI* musicAPIptr;

NSInteger HttpRequestUntilDataTimeout = 5;
NSInteger HttpRequestTimeout = 10;

@implementation MusicAPI

+ (MusicAPI*)sharedInstance
{
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        NSURLSessionConfiguration* configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.allowsCellularAccess = YES;
        configuration.timeoutIntervalForRequest = HttpRequestUntilDataTimeout;
        configuration.timeoutIntervalForResource = HttpRequestTimeout;
        configuration.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        configuration.URLCache = nil;
        
        musicAPIptr = [[self alloc] initWithBaseURL:[NSURL URLWithString:musicBaseURL] sessionConfiguration:configuration];
        musicAPIptr.requestSerializer = [AFJSONRequestSerializer serializer];
        musicAPIptr.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        musicAPIptr.responseSerializer = [AFJSONResponseSerializer serializer];
    });
    
    return musicAPIptr;
}

#pragma mark - Requests

- (NSURLSessionDataTask*)GET:(NSString*)URLString parameters:(NSDictionary*)parameters onCompletion:(APIResponseBlock)completionBlock
{
    NSURLSessionDataTask* task = [super GET:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        completionBlock([APIResponse responseWithJSON:responseObject requestFailed:NO noInternetConnection:NO]);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completionBlock([APIResponse responseWithJSON:nil requestFailed:YES noInternetConnection:(error.code == NSURLErrorNotConnectedToInternet)]);
    }];
    return task;
}

@end

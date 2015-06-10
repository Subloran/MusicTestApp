//
//  MusicAPI.h
//  MusicTestApp
//
//  Created by Artem on 10/06/15.
//  Copyright (c) 2015 Artem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "APIResponse.h"

extern NSString* musicBaseURL;

@interface MusicAPI : AFHTTPSessionManager

+ (MusicAPI*)sharedInstance;

- (NSURLSessionDataTask*)GET:(NSString*)URLString parameters:(NSDictionary*)parameters onCompletion:(APIResponseBlock)completionBlock;

@end

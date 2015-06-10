//
//  APIResponse.m
//  MusicTestApp
//
//  Created by Artem on 10/06/15.
//  Copyright (c) 2015 Artem. All rights reserved.
//

#import "APIResponse.h"

@implementation APIResponse

+ (APIResponse*)responseWithJSON:(NSDictionary*)json requestFailed:(BOOL)requestFailed noInternetConnection:(BOOL)noInternetConnection
{
    APIResponse* response = [[APIResponse alloc] init];
    response.noInternetConnection = noInternetConnection;
    
    if([json isKindOfClass:[NSDictionary class]])
    {
        response.json = json;
        response.requestFailed = requestFailed || json.count == 0;
    }
    else
    {
        response.json = nil;
        response.requestFailed = YES;
    }
    
    return response;
}

@end

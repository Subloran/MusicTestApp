//
//  APIResponse.h
//  MusicTestApp
//
//  Created by Artem on 10/06/15.
//  Copyright (c) 2015 Artem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIResponse : NSObject

@property (nonatomic, strong) NSDictionary* json;
@property (nonatomic) BOOL requestFailed;
@property (nonatomic, strong) NSString* errorCode;
@property (nonatomic) BOOL noInternetConnection;

+ (APIResponse*)responseWithJSON:(NSDictionary*)json requestFailed:(BOOL)requestFailed noInternetConnection:(BOOL)noInternetConnection;

@end

typedef void (^APIResponseBlock)(APIResponse* response);

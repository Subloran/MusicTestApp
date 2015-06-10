//
//  MusicObject.h
//  MusicTestApp
//
//  Created by Artem on 10/06/15.
//  Copyright (c) 2015 Artem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicObject : NSObject

@property (nonatomic, strong) NSString* ID;
@property (nonatomic, strong) NSString* artist;
@property (nonatomic, strong) NSURL* picUrl;
@property (nonatomic, strong) NSURL* demoUrl;
@property (nonatomic, strong) NSString* title;

+ (MusicObject*)objectWithJSON:(NSDictionary*)json;

@end

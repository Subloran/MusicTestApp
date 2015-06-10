//
//  MusicObject.m
//  MusicTestApp
//
//  Created by Artem on 10/06/15.
//  Copyright (c) 2015 Artem. All rights reserved.
//

#import "MusicObject.h"

@implementation MusicObject

+ (MusicObject*)objectWithJSON:(NSDictionary*)json
{
    MusicObject* object = [[MusicObject alloc] init];
    object.title = json[@"title"];
    object.picUrl = [NSURL URLWithString:json[@"picUrl"]];
    object.artist = json[@"artist"];
    return object;
}

@end

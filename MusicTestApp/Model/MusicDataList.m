//
//  MusicDataList.m
//  MusicTestApp
//
//  Created by Artem on 10/06/15.
//  Copyright (c) 2015 Artem. All rights reserved.
//

#import "MusicDataList.h"

@implementation MusicDataList

@synthesize dataList;

- (id)init
{
    if(self = [super init])
    {
        dataList = [NSMutableArray array];
    }
    
    return self;
}

+ (MusicDataList*)dataListWithJSON:(NSDictionary*)source
{
    MusicDataList* data = [[MusicDataList alloc] init];
    [data addDataWithJSON:source];
    return data;
}

- (void)addDataWithJSON:(NSDictionary*)source
{
    NSArray* melodies = source[@"melodies"];
    for (NSDictionary* melody in melodies)
    {
        MusicObject* newMelody = [MusicObject objectWithJSON:melody];
        [dataList addObject:newMelody];
    }
    return;
}

- (void)clear
{
    [dataList removeAllObjects];
}

@end

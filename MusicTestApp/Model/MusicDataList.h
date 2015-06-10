//
//  MusicDataList.h
//  MusicTestApp
//
//  Created by Artem on 10/06/15.
//  Copyright (c) 2015 Artem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicObject.h"

@interface MusicDataList : NSObject
{
    NSMutableArray* dataList;
}
@property (nonatomic, strong, readonly) NSMutableArray* dataList;

+ (MusicDataList*)dataListWithJSON:(NSDictionary*)source;

- (void)addDataWithJSON:(NSDictionary*)source;
- (void)clear;

@end

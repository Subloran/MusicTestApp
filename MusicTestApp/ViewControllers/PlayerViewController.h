//
//  PlayerViewController.h
//  MusicTestApp
//
//  Created by Artem on 10/06/15.
//  Copyright (c) 2015 Artem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "MusicObject.h"

@protocol PlayerViewControllerDelegate <NSObject>


@end

@protocol PlayerViewControllerDataSource <NSObject>

- (MusicObject*)musicObjectForIndex:(NSInteger)index;

@end

@interface PlayerViewController : UIViewController
{
    IBOutlet UIImageView *cover;
    IBOutlet UILabel *artist;
    IBOutlet UILabel *song;
    IBOutlet UISegmentedControl *playbackControl;
    IBOutlet UIProgressView *progressIndicator;
    
    AVPlayer* player;
    NSTimer* timer;
    MusicObject* currentMusicObject;
}

@property (nonatomic, weak) id<PlayerViewControllerDelegate> delegate;
@property (nonatomic, weak) id<PlayerViewControllerDataSource> dataSource;

@property (nonatomic, assign) NSInteger trackIndex;

@end

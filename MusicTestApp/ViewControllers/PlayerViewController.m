//
//  PlayerViewController.m
//  MusicTestApp
//
//  Created by Artem on 10/06/15.
//  Copyright (c) 2015 Artem. All rights reserved.
//

#import <UIImageView+ProgressView.h>
#import "PlayerViewController.h"

@implementation PlayerViewController

@synthesize trackIndex;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    currentMusicObject = [self.dataSource musicObjectForIndex:trackIndex];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(refreshProgress) userInfo:nil repeats:YES];
    [self refreshPlayer];
    [player play];
    playbackControl.selectedSegmentIndex = 0;
}

- (void)viewDidDisappear:(BOOL)animated
{
    if (self.navigationController == nil || self.navigationController.viewControllers.lastObject != self)
        player = nil;
    [super viewDidDisappear:animated];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [timer invalidate];
    timer = nil;
}

- (void)refreshPlayer
{
    [cover sd_setImageWithURL:currentMusicObject.picUrl];
    artist.text = currentMusicObject.artist;
    song.text = currentMusicObject.title;
    [progressIndicator setProgress:0.0f animated:NO];
    playbackControl.selectedSegmentIndex = 2;
    player = [AVPlayer playerWithURL:currentMusicObject.demoUrl];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:[player currentItem]];
//    [player addObserver:self forKeyPath:@"status" options:0 context:nil];
}

- (void)refreshProgress
{
    if (player.currentItem != nil)
    {
        double duration = CMTimeGetSeconds(player.currentItem.duration);
        if (duration == 0)
            duration = 1;
        double time = CMTimeGetSeconds(player.currentItem.currentTime);
        
        NSLog(@"%f", (time / duration));
        [progressIndicator setProgress:(CGFloat) (time / duration) animated:NO];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)playbackControlChanged:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex)
    {
        case 0:
            [player play];
            break;
        case 1:
            [player pause];
            break;
        case 2:
            [player pause];
            [player seekToTime:CMTimeMake(0, player.currentTime.timescale)];
            break;
            
        default:
            break;
    }
    
    [self refreshProgress];
}

- (void)playerItemDidReachEnd:(NSNotification*)notification
{
    return;
}

@end

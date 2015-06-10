//
//  MusicTableViewCell.m
//  MusicTestApp
//
//  Created by Artem on 10/06/15.
//  Copyright (c) 2015 Artem. All rights reserved.
//

#import "MusicTableViewCell.h"

@implementation MusicTableViewCell

@synthesize musicObject;

- (void)setMusicObject:(MusicObject *)newMusicObject
{
    musicObject = newMusicObject;
    [cover sd_setImageWithURL:musicObject.picUrl];
    artist.text = musicObject.artist;
    song.text = musicObject.title;
}

- (void)awakeFromNib
{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end

//
//  MusicTableViewCell.h
//  MusicTestApp
//
//  Created by Artem on 10/06/15.
//  Copyright (c) 2015 Artem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+ProgressView.h>
#import "MusicObject.h"

@interface MusicTableViewCell : UITableViewCell
{
    IBOutlet UIImageView *cover;
    IBOutlet UILabel *artist;
    IBOutlet UILabel *song;
}

@property (nonatomic, weak) MusicObject* musicObject;

@end

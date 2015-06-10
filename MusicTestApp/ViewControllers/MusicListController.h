//
//  MusicListController.h
//  MusicTestApp
//
//  Created by Artem on 10/06/15.
//  Copyright (c) 2015 Artem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicDataList.h"
#import "PlayerViewController.h"

@interface MusicListController : UIViewController <UITableViewDataSource, UITableViewDelegate, PlayerViewControllerDelegate, PlayerViewControllerDataSource>
{
    MusicDataList* musicDataList;
    NSInteger currentLastIndex;
    NSInteger perPage;
    
    NSURLSessionDataTask* loadMusicTask;
}

@property (nonatomic, strong) IBOutlet UITableView *table;

@end

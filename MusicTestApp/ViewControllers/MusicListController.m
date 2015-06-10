//
//  MusicListController.m
//  MusicTestApp
//
//  Created by Artem on 10/06/15.
//  Copyright (c) 2015 Artem. All rights reserved.
//

#import "MusicListController.h"
#import "MusicTableViewCell.h"
#import "MusicAPI.h"
#import <UIScrollView+InfiniteScroll.h>

@implementation MusicListController

@synthesize table;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [table registerNib:[UINib nibWithNibName:@"MusicTableViewCell" bundle:nil] forCellReuseIdentifier:@"musicCell"];
    perPage = 20;
    currentLastIndex = 0;
    __weak MusicListController* weakSelf = self;
    [table addInfiniteScrollWithHandler:^(id scrollView) {
        [weakSelf loadData];
    }];
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return currentLastIndex;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MusicTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"musicCell"];
    cell.musicObject = musicDataList.dataList[indexPath.row];
    return cell;
}

#pragma mark - Loading data

- (void)loadData
{
    if (loadMusicTask == nil)
    {
        __weak MusicListController* weakSelf = self;
        NSDictionary* params = @{@"limit": [NSString stringWithFormat:@"%ld", (long)perPage], @"from": [NSString stringWithFormat:@"%ld", (long)currentLastIndex]};
        loadMusicTask = [[MusicAPI sharedInstance] GET:musicBaseURL parameters:params onCompletion:^(APIResponse *response) {
            if (response.requestFailed)
            {
                loadMusicTask = nil;
                [weakSelf loadData];
            }
            else
            {
                currentLastIndex += perPage;
                perPage = 10;
                if (musicDataList == nil)
                    musicDataList = [MusicDataList dataListWithJSON:response.json];
                else
                    [musicDataList addDataWithJSON:response.json];
                
                if (currentLastIndex > musicDataList.dataList.count)
                {
                    currentLastIndex = musicDataList.dataList.count;
                    [weakSelf.table finishInfiniteScrollWithCompletion:^(id scrollView) {
                        [weakSelf.table removeInfiniteScroll];
                    }];
                }

                [weakSelf.table reloadData];
                [weakSelf.table finishInfiniteScroll];
            }
            loadMusicTask = nil;
        }];
    }
}

@end

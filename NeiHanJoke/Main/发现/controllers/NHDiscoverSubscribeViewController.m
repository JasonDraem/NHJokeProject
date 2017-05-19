//
//  NHDiscoverSubscribeViewController.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/7.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHDiscoverSubscribeViewController.h"
#import "NHRequestManager+NHDiscoverRequestCatogry.h"
#import "NHDouBanMovieShowModel.h"
#import "NHDouBanImagesTableViewCell.h"

@interface NHDiscoverSubscribeViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

static NSString *kNHDiscoverSubscribeViewControllerCellId = @"NHDiscoverSubscribeViewControllerCellId";

@implementation NHDiscoverSubscribeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [self setupConfig];
    [self.baseTableView.mj_header beginRefreshing];
}

- (void)setupConfig{
    self.view.backgroundColor = kNHGeneralColor_WhiteColor;
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([NHDouBanImagesTableViewCell class]) bundle:nil];
    [self.baseTableView registerNib:nib forCellReuseIdentifier:kNHDiscoverSubscribeViewControllerCellId];
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;
    MJRefreshNormalHeader *hearder = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getDataFromeRemoteService];
    }];
    self.baseTableView.mj_header = hearder;
    [self changeStatesText:hearder];
}

- (void)getDataFromeRemoteService{
    
    weakify(self)
    
    if (_isLoading) {
        return;
    }
    _isLoading = YES;
    if (0 == self.baseDataSource.count) {
        [SVProgressHUD showWithStatus:@"加载中..."];
    }
    //
    [NHRequestManager nhDiscoverGetDataWithUrl:kDOUBANMOVIE_API responcese:^(NHDouBanMovieShowModel *model, NSError *error) {
        __strong typeof(weak_self) strongSelf = weak_self;
        _isLoading = NO;
        //
        if (_getDataType == XXYGetDataHeaderRefresh) {
            [strongSelf.baseTableView.mj_header endRefreshing];
        }

        if (_getDataType == XXYGetDataHeaderRefresh) {
            [strongSelf.baseTableView.mj_header endRefreshing];
            [strongSelf.baseDataSource removeAllObjects];
        }
        //
        for (NHEntriesModel *entriesModel in model.entries) {
            [strongSelf.baseDataSource addObject:entriesModel];
        }
        _getDataType = XXYGetDataNormalRefresh;
        [strongSelf.baseTableView reloadData];
        [SVProgressHUD dismissWithDelay:1.5f];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.baseDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NHDouBanImagesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNHDiscoverSubscribeViewControllerCellId];
    
    NHEntriesModel *model = self.baseDataSource[indexPath.row];
    [cell nh_updateDataWithModel:model];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

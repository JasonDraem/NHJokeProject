//
//  NHHomeBaseViewController.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/7.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHHomeBaseViewController.h"

@interface NHHomeBaseViewController ()


@end

static NSString *kBaseTableViewCellId = @"kBaseTableViewCellId";

@implementation NHHomeBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kNHGeneralColor_WhiteColor;
    _currentPage = 0;
    //
    _getDataType = XXYGetDataNormalRefresh;
    //
    _isLoading = NO;
}

- (NSMutableArray *)baseDataSource{
    if (!_baseDataSource) {
        _baseDataSource = [[NSMutableArray alloc] init];
    }
    return _baseDataSource;
}

- (UITableView *)baseTableView{
    if (!_baseTableView) {
        _baseTableView = [[UITableView alloc] init];
        _baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_baseTableView];
        [_baseTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return _baseTableView;
}

/**
 *  请求数据
 */
- (void)getDataFromeRemoteService{}
#pragma mark - 刷新和加载 -
- (void)changeStatesText:(MJRefreshNormalHeader *)header{
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"即将进入刷新状态" forState:MJRefreshStateWillRefresh];
    [header setTitle:@"正在刷新..." forState:MJRefreshStateRefreshing];
    [header setTitle:@"刷新完毕" forState:MJRefreshStateNoMoreData];
    //更改状态颜色
    header.stateLabel.textColor = [UIColor grayColor];
    //更改显示时间颜色
    header.lastUpdatedTimeLabel.textColor = [UIColor grayColor];
}
/**
 *  下拉刷新
 */
- (void)getDataHeaderRefresh{
    _getDataType = XXYGetDataHeaderRefresh;
    [self getDataFromeRemoteService];
}
/*
 *  上拉加载
 */
- (void)getDataFooterRefresh{
    _getDataType = XXYGetDataFooterRefresh;
    [self getDataFromeRemoteService];
}


#pragma mark -  UITableViewDataSource, UITableViewDelegate



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

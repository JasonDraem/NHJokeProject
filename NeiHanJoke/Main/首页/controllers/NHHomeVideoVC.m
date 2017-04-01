//
//  NHHomeVideoVC.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/7.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHHomeVideoVC.h"
#import "NHRequestManager.h"
#import "NHRequestManager+NHHomeVedioRequest.h"
#import "NHHomeVideoModel.h"

static NSString *const homeVideoCellID = @"homeVideoCellID";

@interface NHHomeVideoVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation NHHomeVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getDataFromeRemoteService];
}

- (void)getDataFromeRemoteService{
    [NHRequestManager getNHHomeVedioDataResponseObject:^(NHHomeVideoModel *responseObject, NSError *error) {
        [self.dataSource addObject:responseObject];
        [self.tableView reloadData];
        kXXYLog(@"coverImage-------->:%@", responseObject);
        if (1 == [responseObject.type integerValue]) {
            kXXYLog(@"responseObject.large_coverImage:%@", responseObject.title);
        }else if (5 == [responseObject.type integerValue]){
            //kXXYLog(@"responseObject.display_info:%@", responseObject.display_info);
        }
    }];
}

/**
 *  懒加载tableview
 *
 *  @return <#return value description#>
 */
- (UITableView*)tableView{
    if (!_tableView) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kXXYScreenW, kXXYScreenH - 49 - 64 - 25) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:homeVideoCellID];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
/**
 *  懒加载datasource
 *
 *  @return <#return value description#>
 */
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

#pragma mark - <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeVideoCellID];
    NHHomeVideoModel *videoModel = self.dataSource[indexPath.row];
    
    if (1 == [videoModel.type integerValue]) {
        cell.textLabel.text = videoModel.title;
        kXXYLog(@"videoModel.mp4_url---->:%@, %@", videoModel.mp4_url, videoModel.large_coverImage);
    }else if (5 == [videoModel.type integerValue]){
        cell.textLabel.text = videoModel.adTitle;
        kXXYLog(@"%@", videoModel.display_info);
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

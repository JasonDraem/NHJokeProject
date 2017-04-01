//
//  NHDiscoverViewController.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/4.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHDiscoverViewController.h"
#import "NHDiscoverHotViewController.h"
#import "NHDiscoverSubscribeViewController.h"
#import "NHUikitTool.h"

#define kNHDiscoverVCSegmentControlWidth            100
#define kNHDiscoverVCSegmentControlHeight           30
#define kNHDiscoverVCSegmentControlTopMargain       20


@interface NHDiscoverViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *nhDiscoverScrollView;
@property (nonatomic, strong) UISegmentedControl *nhDiscoverSegmentControl;
@end

@implementation NHDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nhDiscoverSegmentControl.multipleTouchEnabled = NO;
    [self addSubviewController];
}

- (UISegmentedControl *)nhDiscoverSegmentControl{
    if (!_nhDiscoverSegmentControl) {
        NSArray *titleArr = @[@"热吧", @"订阅"];
        _nhDiscoverSegmentControl = [NHUikitTool nhPublicSegmentControlWithItemTitles:titleArr];
        _nhDiscoverSegmentControl.frame = CGRectMake(0, kNHDiscoverVCSegmentControlTopMargain, kNHDiscoverVCSegmentControlWidth, kNHDiscoverVCSegmentControlHeight);
        [self.navigationItem setTitleView:_nhDiscoverSegmentControl];
        [_nhDiscoverSegmentControl addTarget:self action:@selector(clickSegmentControlHandler:) forControlEvents:UIControlEventValueChanged];
    }
    return _nhDiscoverSegmentControl;
}

- (UIScrollView *)nhDiscoverScrollView{
    if (_nhDiscoverScrollView) {
        _nhDiscoverScrollView = [NHUikitTool nhPublicScrollViewWithFrame:kXXYScreenBounds ContentSize:CGSizeMake(kXXYScreenW * 2, kXXYScreenH)];
        self.automaticallyAdjustsScrollViewInsets = NO;
        _nhDiscoverScrollView.delegate = self;
        [self.view addSubview:_nhDiscoverScrollView];
    }
    return _nhDiscoverScrollView;
}

- (void)addSubviewController{
    NHDiscoverHotViewController * hotVC = [[NHDiscoverHotViewController alloc] init];
    NHDiscoverSubscribeViewController * subscribeVC = [[NHDiscoverSubscribeViewController alloc] init];
    
    [self addChildViewController:hotVC];
    [self addChildViewController:subscribeVC];
    
    [self.nhDiscoverScrollView addSubview:hotVC.view];
    [self.nhDiscoverScrollView addSubview:subscribeVC.view];
    
    //set location
    CGRect responderRect = hotVC.view.frame;
    responderRect.origin.x = kXXYScreenW;
    responderRect.size.height = CGRectGetHeight(self.nhDiscoverScrollView.frame);
    subscribeVC.view.frame = responderRect;
}

- (void)clickSegmentControlHandler:(UISegmentedControl *)seg{
    NSInteger index = seg.selectedSegmentIndex;
    CGRect frame = self.nhDiscoverScrollView.frame;
    frame.origin.x = index * CGRectGetWidth(self.nhDiscoverScrollView.frame);
    frame.origin.y = 0;
    [self.nhDiscoverScrollView scrollRectToVisible:frame animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    CGFloat offSetX = scrollView.contentOffset.x;
    NSInteger ratio = round(offSetX / kXXYScreenW);
    self.nhDiscoverSegmentControl.selectedSegmentIndex = ratio;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

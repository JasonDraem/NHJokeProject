//
//  NHHomeViewController.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/4.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHHomeViewController.h"
#import "NHHomeSelectViewController.h"
#import "NHFocusOnViewController.h"
#import "NHUikitTool.h"

#define kNHHomeVCSegmentControlWidth            100
#define kNHHomeVCSegmentControlHeight           30
#define kNHHomeVCSegmentControlTopMargain       20


@interface NHHomeViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UISegmentedControl *nhHomeSegmentControl;
@property (nonatomic, strong) UIScrollView *nhHomeScrollView;
@property (nonatomic, assign) BOOL arrowBool;
@end

@implementation NHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kNHGeneralColor_WhiteColor;
    //[self.navigationItem setTitleView:self.nhHomeSegmentControl];
    self.nhHomeSegmentControl.multipleTouchEnabled = NO;
    [self addSubviewControllers];
}

/**
 Lazy loading UIScrollView

 @return <#return value description#>
 */
- (UIScrollView *)nhHomeScrollView{
    if (_nhHomeScrollView == nil) {
        _nhHomeScrollView = [NHUikitTool nhPublicScrollViewWithFrame:kXXYScreenBounds ContentSize:CGSizeMake(kXXYScreenW * 2, kXXYScreenH)];
        self.automaticallyAdjustsScrollViewInsets = NO;
        _nhHomeScrollView.delegate = self;
        [self.view addSubview:_nhHomeScrollView];
    }
    return _nhHomeScrollView;
}

/**
 Lazy loading  UISegmentedControl

 @return <#return value description#>
 */
- (UISegmentedControl *)nhHomeSegmentControl{
    if (_nhHomeSegmentControl == nil) {
        NSArray * itemTitles = @[@"精选", @"关注"];
        _nhHomeSegmentControl = [NHUikitTool nhPublicSegmentControlWithItemTitles:itemTitles];
        _nhHomeSegmentControl.frame = CGRectMake(0, kNHHomeVCSegmentControlTopMargain, kNHHomeVCSegmentControlWidth, kNHHomeVCSegmentControlHeight);
        [self.navigationItem setTitleView:_nhHomeSegmentControl];
        //add target
        [_nhHomeSegmentControl addTarget:self action:@selector(segmentClickHandler:) forControlEvents:UIControlEventValueChanged];
    }
    return _nhHomeSegmentControl;
}

/**
 segementClickHandler

 @param seg <#seg description#>
 */
- (void)segmentClickHandler:(UISegmentedControl *)seg{
    //self.nhHomeSegmentControl = seg;
    NSInteger index = seg.selectedSegmentIndex;
    CGRect frame = self.nhHomeScrollView.frame;
    frame.origin.x = index * CGRectGetWidth(self.nhHomeScrollView.frame);
    frame.origin.y = 0;
    [self.nhHomeScrollView scrollRectToVisible:frame animated:YES];
}

/**
 add childVC
 */
- (void)addSubviewControllers{
    NHHomeSelectViewController *nhSelectVC = [[NHHomeSelectViewController alloc] init];
    NHFocusOnViewController *nhFocusOnVC = [[NHFocusOnViewController alloc]init];
    self.arrowBool = nhSelectVC.popViewBool;
    //add childVC
    [self addChildViewController:nhSelectVC];
    [self addChildViewController:nhFocusOnVC];
    //add childView
    [self.nhHomeScrollView addSubview:nhSelectVC.view];
    [self.nhHomeScrollView addSubview:nhFocusOnVC.view];
    //set location
    CGRect responderRect = nhSelectVC.view.frame;
    responderRect.origin.x = kXXYScreenW;
    responderRect.size.height = CGRectGetHeight(self.nhHomeScrollView.frame);
    nhFocusOnVC.view.frame = responderRect;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offSetX = scrollView.contentOffset.x;
    NSInteger ratio = round(offSetX / kXXYScreenW);
    self.nhHomeSegmentControl.selectedSegmentIndex = ratio;
}
























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

//
//  NHHomeSelectViewController.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/7.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHHomeSelectViewController.h"
#import "NHHomeBaseViewController.h"
#import "SCNavTabBarController.h"

@interface NHHomeSelectViewController ()
/**
 @property (nonatomic, assign)   BOOL        showArrowButton; //右侧指示箭头
 @property (nonatomic, assign)   BOOL        scrollAnimation; //
 @property (nonatomic, assign)   BOOL        mainViewBounces;
 @property (nonatomic, strong)   NSArray     *subViewControllers;
 @property (nonatomic, strong)   UIColor     *navTabBarColor;
 @property (nonatomic, strong)   UIColor     *navTabBarLineColor;
 @property (nonatomic, strong)   UIImage     *navTabBarArrowImage;
*/
@end

@implementation NHHomeSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kNHColor_BlackColor;
    [self configurationVC];
}

- (void)configurationVC{
    NSArray *titlesArr = @[@[@"直播", @"Live"], @[@"推荐", @"TuiJian"],
                           @[@"视频", @"Video"], @[@"图片", @"Image"],
                           @[@"段子", @"DuanZi"], @[@"精华", @"JingHua"],
                           @[@"同城", @"SameCity"], @[@"游戏", @"Game"],
                           ];
    NSMutableArray *controllersArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < titlesArr.count; i ++) {
        NSString *controllerTitle = [NSString stringWithFormat:@"NHHome%@VC", titlesArr[i][1]];
        Class cla = NSClassFromString(controllerTitle);
        NHHomeBaseViewController *nhBaseVC = [[cla alloc] init];
        nhBaseVC.title = titlesArr[i][0];
        [controllersArr addObject:nhBaseVC];
    }
    //第一种添加navtabbar方法
    SCNavTabBarController *scTabbarController = [[SCNavTabBarController alloc] init];
    scTabbarController.subViewControllers = controllersArr;
    scTabbarController.canPopAllItemMenu = YES;
    scTabbarController.scrollAnimation = YES;
    scTabbarController.navTabBarColor = kNHGeneralColor_WhiteColor;
    scTabbarController.navTabBarLineColor = [UIColor lightGrayColor];
    [scTabbarController addParentController:self];
    //第二种添加navtabbar方法
//    SCNavTabBarController *sctvc = [[SCNavTabBarController alloc] initWithSubViewControllers:controllersArr andParentViewController:self canPopAllItemMenu:YES];
//    sctvc.scrollAnimation = YES;
//    sctvc.navTabBarLineColor = [UIColor lightGrayColor];
//    sctvc.navTabBarColor = kNHGeneralColor_WhiteColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

//
//  NHTabBarViewController.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/4.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHTabBarViewController.h"
#import "NHBaseViewController.h"
#import "UIColor+XXYExtension.h"
#import "NHCustomNavigationController.h"

#import "NHMainTabbar.h"
#import "NHMainViewController.h"
#import "NHHomeViewController.h"
#import "NHFocusOnViewController.h"

#import "NHFreshViewController.h"
#import "NHMessagesViewController.h"


@interface NHTabBarViewController ()<NHTabBarDelegate>

@end

@implementation NHTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [self createTabBar];
}

/**
 create tabbar
 */
- (void)createTabBar{
    //1. 设置tabbar item颜色
    self.tabBar.barTintColor = [UIColor colorWithWhite:205 alpha:1.0f];
    //tabbar
    NSArray *tabbarGroups = @[@[@"首页", @"NHHome", @"home"],
                              @[@"发现", @"NHDiscover", @"Found"],
                              @[@"新鲜", @"NHFresh", @"freshnew"],
                              @[@"消息", @"NHMessages", @"newstab"]];
    //controllers use save controllers
    NSMutableArray * controllers = [NSMutableArray array];
    //循环创建tabbar对应的vc
    for (NSInteger i = 0; i < tabbarGroups.count; i ++) {
        //1. 将对应的视图名转换为视图类
        NSString * cla = [NSString stringWithFormat:@"%@ViewController", tabbarGroups[i][1]];
        Class className = NSClassFromString(cla);
        //2. 由基础类创建
        NHBaseViewController *baseVC = [[className alloc] init];
        NHCustomNavigationController *nhNVC = [[NHCustomNavigationController alloc] initWithRootViewController:baseVC];
        baseVC.navigationItem.title = tabbarGroups[i][0];
        //3. 获取item图片名称
        NSString *imageNameStr = [NSString stringWithFormat:@"%@", tabbarGroups[i][2]];
        //4. 正常模式下图片
        UIImage *normallage = [[UIImage imageNamed:imageNameStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //5. 选中模式下图片
        UIImage *selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_press", imageNameStr]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //6. 创建item
        UITabBarItem *items = [[UITabBarItem alloc] initWithTitle:tabbarGroups[i][0] image:normallage selectedImage:selectedImage];
//
        baseVC.tabBarItem = items;
        
        [controllers addObject:nhNVC];
    }
    //7. 设置item颜色
    [self tabbarItemColor];
    //8. 去除tabbar上横线
    //[self removeLineOnTabbar];
    
    self.viewControllers = controllers;
    //9. 创建中间主页视图
    NHMainTabbar *tabbar = [[NHMainTabbar alloc] init];
    //10. 设置代理
    tabbar.delegate = self;
    [self setValue:tabbar forKey:@"tabBar"];
}

/**
 * settimg tabbar's color && normalColor and selectedColor
 */
- (void)tabbarItemColor{
    //
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:kXXYColor(169, 183, 183, 1.0f), NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
    //
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:kXXYColor(106, 85, 72, 1.0f), NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
    //
    [[UITabBar appearance] setBackgroundColor:[UIColor redColor]];
    [UITabBar appearance].translucent = NO;
}
#pragma mark - NHTabBarDelegate
- (void)nh_tabbarDidClickPlusButton:(NHMainTabbar *)tabbar{
    NHMainViewController *mainVC = [[NHMainViewController alloc] init];
    NHCustomNavigationController *nhNVC = [[NHCustomNavigationController alloc] initWithRootViewController:mainVC];
    mainVC.navigationItem.title = @"主页";
    [self presentViewController:nhNVC animated:YES completion:nil];
//    UIWindow *kWindow = [UIApplication sharedApplication].keyWindow;
//    kWindow.rootViewController = nhNVC;
}

/**
 去除tabbar分界线
 */
- (void)removeLineOnTabbar{
    CGRect rect = CGRectMake(0, 0, kXXYScreenW, kXXYScreenH);
    //strat drawImage
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //over drawImage
    UIGraphicsEndImageContext();
    [self.tabBar setBackgroundImage:image];
    [self.tabBar setShadowImage:image];
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

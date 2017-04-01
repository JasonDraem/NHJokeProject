//
//  NHCustomNavigationController.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/4.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHCustomNavigationController.h"

@interface NHCustomNavigationController ()<UINavigationControllerDelegate>
@property (nonatomic, weak) id PopDelegate;
@end

@implementation NHCustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //解决返回手势实效问题
    self.PopDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        [self customNavigationBar];
    }
    return self;
}

- (void)customNavigationBar{
   UINavigationBar *navigationBar = [UINavigationBar appearance];
    //改变导航栏背景色
    [navigationBar setBarTintColor:kXXYColor(209, 217, 205, 1.0)];
    //设置导航栏返回箭头颜色
    [navigationBar setTintColor:kNHGeneralColor_WhiteColor];
    if (IOS_VERSION_7_OR_Below) {
        [navigationBar setTintColor:kNHGeneralColor_WhiteColor]; //// iOS7的情况下,设置NavigationBarItem文字的颜色
    }
    //设置导航栏文字主题
    NSShadow *shadow = [[NSShadow alloc] init];
    [shadow setShadowOffset:CGSizeZero];
    [navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSShadowAttributeName:shadow}];
    //修改UIBarButtonItem的外观
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
    if (IOS_VERSION_7_OR_Above) {
        [barButtonItem setTintColor:kNHGeneralColor_WhiteColor];
    }else{
        // 修改item上面的文字样式
        NSDictionary *dict =@{NSForegroundColorAttributeName : kNHGeneralColor_WhiteColor, NSShadowAttributeName : shadow};
        [barButtonItem setTitleTextAttributes:dict forState:UIControlStateNormal];
        [barButtonItem setTitleTextAttributes:dict forState:UIControlStateHighlighted];
    }
    //设置状态栏样式
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

//统一定制返回按钮样式
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (viewController.navigationItem.leftBarButtonItem ==nil && self.viewControllers.count > 1) {
        viewController.navigationItem.leftBarButtonItem = [self creatBackButton];
    }
    //解决push时隐藏tabbar
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

/**
 custom backBarItem

 @return <#return value description#>
 */
-(UIBarButtonItem *)creatBackButton{
    return //[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_back"] style:UIBarButtonItemStylePlain target:self action:@selector(popSelf)];
    [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(popSelf)];
}

-(void)popSelf{
    [self popViewControllerAnimated:YES];
}
#pragma mark - 解决返回手势实效问题
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = self.PopDelegate;
    }else{
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}
/**
 set statusBarStyle
 
 @return  UIStatusBarStyle
 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

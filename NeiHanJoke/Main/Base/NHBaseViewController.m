//
//  NHBaseViewController.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/4.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHBaseViewController.h"
#import "NHUserInfoViewController.h"
#import "NHGeneralEditeViewController.h"

#define kNHBaseVCLeftItemWidth              30
#define kNHBaseVCLeftItemHeight             30

@interface NHBaseViewController ()

@property (nonatomic, strong) UIView *nh_NavigationView;

@end

@implementation NHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    //[self configurationSetting];
    
    [self configuratinNavigationVCItem];
}
/**
 * attribution setting
 */
- (void)configurationSetting{
    self.navigationController.navigationBarHidden = YES;
}

/**
 custom letfItem 
 userInfoVC
 */
- (void)configuratinNavigationVCItem{
    //左item
//    UIBarButtonItem *userInfoItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"defaulthead"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(popBackAciton)];
//    self.navigationItem.leftBarButtonItem = userInfoItem;
    UIButton*rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,kNHBaseVCLeftItemWidth,kNHBaseVCLeftItemHeight)];
    //rightButton.backgroundColor = [UIColor redColor];
    [rightButton setImage:[[UIImage imageNamed:@"defaulthead"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(popBackAciton)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*userInfoItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.leftBarButtonItem= userInfoItem;
    //右item
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"submission"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

/**
 backButton
 */
- (void)popBackAciton{
    NHUserInfoViewController *nhUserInfoVC = [[NHUserInfoViewController alloc] init];
    [self.navigationController pushViewController:nhUserInfoVC animated:YES];
}

- (void)rightItemAction{
    NHGeneralEditeViewController *generalEditeVC = [[NHGeneralEditeViewController alloc]init];
    [self.navigationController pushViewController:generalEditeVC animated:YES];
}














































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

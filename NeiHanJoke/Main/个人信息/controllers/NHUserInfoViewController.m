//
//  NHUserInfoViewController.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/7.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHUserInfoViewController.h"

@interface NHUserInfoViewController ()

@end

@implementation NHUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kNHColor_BlackColor;
    [self configurationSetting];
}

- (void)configurationSetting{
    self.navigationItem.title = @"我的";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

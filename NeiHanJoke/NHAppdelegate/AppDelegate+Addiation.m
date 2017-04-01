//
//  AppDelegate+Addiation.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/4.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "AppDelegate+Addiation.h"

#import "NHTabBarViewController.h"

@implementation AppDelegate (Addiation)

- (void)configrationRootVC{
    NHTabBarViewController *tabVC = [[NHTabBarViewController alloc] init];
    self.window.rootViewController = tabVC;
}

@end

//
//  NHMainTabbar.h
//  NeiHanJoke
//
//  Created by Jason_Xu on 2017/4/1.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NHMainTabbar;

/**
 主页tabbar 代理
 */
@protocol NHTabBarDelegate <NSObject>

/**
 点击主页tabbar按钮操作

 @param tabbar <#tabbar description#>
 */
- (void)nh_tabbarDidClickPlusButton:(NHMainTabbar *)tabbar;

@end

@interface NHMainTabbar : UITabBar
/* 声明代理 */
@property (nonatomic, weak) id <NHTabBarDelegate>delegate;

@end

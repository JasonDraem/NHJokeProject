//
//  CallManagerView.h
//  截取字符串
//
//  Created by Jason_Xu on 2017/5/14.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FloatUtilConfig.h"


/**
 屏幕状态

 - XXYCallViewStatePortrait: 竖屏
 - XXYCallViewStateLandscape: 横屏
 - XXYCallViewStateWindow: 小屏
 */
typedef NS_ENUM(NSInteger, XXYCallViewState){
    
//    XXYCallViewStatePortrait = 0, // 竖屏播放
//    XXYCallViewStateLandscape = 1, // 横屏播放
    XXYCallViewStateDefault = 0,
    XXYCallViewStateWindow = 1 // 小窗播放
};

/**
 管理view代理
 */
@protocol CallManagerViewDelegate <NSObject>

/**
 屏幕大小操作控制
 */
- (void)xxy_fullScreentButtonHandle;

@end

@interface CallManagerView : UIView

/**
 init

 @param isVideo 判断是否是视频通话 调整视图
 @return <#return value description#>
 */
- (instancetype)initWithIsVideo:(BOOL)isVideo;

@property (nonatomic, weak) id <CallManagerViewDelegate>delegate;

/**
 悬浮窗口状态
 */
@property (nonatomic, assign) XXYCallViewState state;

@property (nonatomic, strong) UIButton *smallScreenButton;

@property (nonatomic, strong) UIButton *fullScreenButton;
//当前总时间
@property (nonatomic, strong) UILabel *timeLabel;

// 播放器单击手势
@property (nonatomic, strong) UITapGestureRecognizer *callViewTap;
// 播放器拖动手势
@property (nonatomic, strong) UIPanGestureRecognizer *callPanGesture;
// 控制视图显示
@property (nonatomic, assign) BOOL isControlsHidden;

// 控制视图隐藏定时器
@property (nonatomic, strong) NSTimer *controlsTimer;


@end

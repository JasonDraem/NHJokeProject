//
//  FloatUtilConfig.h
//  截取字符串
//
//  Created by Jason_Xu on 2017/5/14.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#ifndef FloatUtilConfig_h
#define FloatUtilConfig_h

#import "UIView+FloatViewFrame.h"
#import "Masonry.h"

typedef void (^VoidBlock)();

#define KScreenBounds [[UIScreen mainScreen] bounds]
#define KControlsHideInterval 5.f
//语音
#define KWindowDisplayWidth 50.f
#define KWindowDisplayHeight 50.f / (16.f / 9.f)
//视频
#define KWindowDisplayWidth1 KScreenBounds.size.width/3
#define KWindowDisplayHeight1 KScreenBounds.size.height/3

#define degreesToRadians(x) (M_PI * x / 180.0f)
//十六进制色值
#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define KANVideoPlayerItemReadyToPlay @"ANVideoPlayerItemReadyToPlay"
#define KANVideoPlayerItemStatusFailed @"ANVideoPlayerItemStatusFailed"

#define kANVideoPlayerDurationDidLoadNotification @"ANVideoPlayerDurationDidLoadNotification"
#define kANVideoPlayerScrubberValueUpdatedNotification @"ANVideoPlayerScrubberValueUpdatedNotification"
#define KANVideoPlayerItemLoadedTimeRangesNotification @"ANVideoPlayerItemLoadedTimeRangesNotification"


#endif /* FloatUtilConfig_h */

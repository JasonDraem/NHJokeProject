//
//  FloatViewTool.h
//  截取字符串
//
//  Created by Jason_Xu on 2017/5/14.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CallManager;

@interface FloatViewUitl : NSObject

@property (nonatomic, strong, readonly) CallManager *currentCallManager;

+ (instancetype)xxy_shareInstance;

/**
 开始通话

 @param phones 成员电话
 @param isVideo 是否是视频通话
 @param isMulti 是否是多方通话
 @param isCalled 是否是被叫
 */
- (void)xxy_startCallWithNumbers:(NSArray *)phones
                         isVideo:(BOOL)isVideo
                         isMulti:(BOOL)isMulti
                        isCalled:(BOOL)isCalled;

- (void)xxy_dismissCurrentFloatView;

@end

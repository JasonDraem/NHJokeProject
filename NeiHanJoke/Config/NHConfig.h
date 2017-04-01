//
//  NHConfig.h
//  NeiHanDuanZiJoke
//
//  Created by Jason_Xu on 2016/11/3.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#ifndef NHConfig_h
#define NHConfig_h

#define kXXYNotificationCenter [NSNotificationCenter defaultCenter]

#ifdef DEBUG
#define kXXYLog(...) NSLog(__VA_ARGS__)
#else
#define kXXYLog(...)
#endif

#define kXXYLogFunc XXYLog(@"%s", __func__)

#define kXXYColor(r, g, b, al) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/ 255.0) alpha:al]

//判断系统版本
#define IOS_VERSION_7_OR_Below (([[[UIDevice currentDevice] systemVersion] floatValue] <= 7.0)? (YES):(NO))
#define IOS_VERSION_7_OR_Above (([[[UIDevice currentDevice] systemVersion] floatValue] <= 7.0)? (YES):(NO))


#define kXXYGlobalBg XXYColor(223, 223, 223)
#define kXXYGlobalSpaceColor [UIColor colorWithHexString:@"#efefef"]

#define kXXYScreenW [UIScreen mainScreen].bounds.size.width
#define kXXYScreenH [UIScreen mainScreen].bounds.size.height
#define kXXYScreenBounds [UIScreen mainScreen].bounds
#define kXXYNavgationBarHeight   64.0f

#define kIphone6ScreenHeight    667.0f
#define kIphone6ScreenWidth     375.0f

#define kViewWidthScale (XXYScreenW / kIphone6ScreenWidth)
#define kViewHeightScale (XXYScreenH / kIphone6ScreenHeight)
//获取image
#define kGetImage(imageName)     [UIImage imageNamed:imageName]
//超时时间处理
#define kTimeoutInterval 30.0f
//语音沙河路径
#define kDocumentPath  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
//判断当前设备机型是否为6
#define kIPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define kISValidNSString(x) (x != NULL && [x length] > 0)

#pragma mark - weakify & strongify
#ifndef    weakify
#if __has_feature(objc_arc)
#define weakify(object) __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) __block __typeof__(object) block##_##object = object;
#endif
#endif
#ifndef    strongify
#if __has_feature(objc_arc)
#define strongify(object) __typeof__(object) strong##_##object = weak##_##object;
#else
#define strongify(object) __typeof__(object) strong##_##object = block##_##object;
#endif
#endif

#define kNHColor_BlackColor                 [UIColor blackColor]
#define kNHGeneralColor_WhiteColor          [UIColor whiteColor]
#define kNHGeneralColor_ClearColor          [UIColor clearColor]
#define kNHGeneralViewBgColor               self.view.backgroundColor = kXXYColor(arc4random()/256%255, arc4random()/256%255, arc4random()/256%255, 1.0)

//各种第三方服务商的appId或者App key
#define kNHJPushAppKey                     (@"")
#define kNHUMShareAppKey                   (@"")
//判断是否登陆key
#define kLoginStatusID                      (@"USER_IDKEY")

#pragma mark - 极光推送相关事件监听类型
//extern NSString * const kJPFNetworkIsConnectingNotification; // 正在连接中
//extern NSString * const kJPFNetworkDidSetupNotification; // 建立连接
//extern NSString * const kJPFNetworkDidCloseNotification; // 关闭连接
//extern NSString * const kJPFNetworkDidRegisterNotification; // 注册成功
//extern NSString * const kJPFNetworkFailedRegisterNotification; //注册失败
//extern NSString * const kJPFNetworkDidLoginNotification; // 登录成功
//extern NSString * const kJPFNetworkDidReceiveMessageNotification; // 收到自定义消息(非APNs)
//


#endif /* NHConfig_h */

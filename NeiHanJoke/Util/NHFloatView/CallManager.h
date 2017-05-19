//
//  CallManager.h
//  截取字符串
//
//  Created by Jason_Xu on 2017/5/14.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CallManagerView.h"


typedef NS_ENUM(NSInteger, XXYCallState){
    XXYCallStateUnknown,
    XXYCallStateContentLoading,
    XXYCallStateContentPlaying,
    XXYCallContentPaused,
    XXYCallStateSuspend,
    XXYCallStateDismissed,
    XXYCallStateError
};

@protocol CallManagerDelegate <NSObject>

- (void)xxy_endCallButtonHandle;

@end

@interface CallManager : NSObject

@property (nonatomic, strong) CallManagerView *callManagerView;

@property (nonatomic, weak) id <CallManagerDelegate> delegate;

@property (nonatomic, assign) XXYCallState state;

@property (nonatomic, assign) CGRect portraitFrame;

@property (nonatomic, assign) CGRect landscapeFrame;

//@property (nonatomic, assign) UIInterfaceOrientation visibleInterfaceOrientation;
//
//@property (nonatomic, assign) UIInterfaceOrientationMask supportedOrientations;

@property (nonatomic, strong) NSArray *phonesArray;

@property (nonatomic, assign) BOOL isFullScreen;

@property (nonatomic, assign) BOOL isVideo;

@property (nonatomic, assign) BOOL isMulti;

@property (nonatomic, assign) BOOL isCalled;

- (instancetype)initWithNumbers:(NSArray *)phones
                        isVideo:(BOOL)isVideo
                        isMulti:(BOOL)isMulti
                       isCalled:(BOOL)isCalled;

/**
 开始通话
 
*/
- (void)xxy_startCallManagerWithNumbers;

@end

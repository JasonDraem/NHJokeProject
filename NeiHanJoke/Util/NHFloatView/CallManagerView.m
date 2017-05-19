//
//  CallManagerView.m
//  截取字符串
//
//  Created by Jason_Xu on 2017/5/14.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import "CallManagerView.h"

@interface CallManagerView ()

/**
 是否滑动
 */
@property (nonatomic, assign) BOOL isSwiping;

/**
 是否视频
 */
@property (nonatomic, assign) BOOL isVideo;

@end

@implementation CallManagerView

- (instancetype)initWithIsVideo:(BOOL)isVideo{
    self = [super init];
    if (self) {
        self.isVideo = isVideo;
        [self xxy_setUpSubviews];
    }
    return self;
}

- (void)xxy_setUpSubviews{
    self.backgroundColor = [UIColor redColor];
   
        //
    [self xxy_setSmallButton];
    //
    [self xxy_setBaseConfig];
}

- (void)xxy_setSmallButton{
    self.isSwiping = NO;
    self.state = XXYCallViewStateDefault;
    //窗口大小控制buttn
    self.smallScreenButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.smallScreenButton setTitle:@"small" forState:UIControlStateNormal];
    [self.smallScreenButton addTarget:self action:@selector(xxy_smallButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.smallScreenButton];
    //
    [self.smallScreenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    //时间
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.timeLabel];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
}

- (void)xxy_removeSmallButton{
    [self.smallScreenButton removeFromSuperview];
    self.smallScreenButton = nil;
}

- (void)xxy_setFullScreenButton{
    self.isSwiping = YES;
    self.state = XXYCallViewStateWindow;
    //窗口大小控制buttn
    self.fullScreenButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.fullScreenButton setTitle:@"full" forState:UIControlStateNormal];
    [self.fullScreenButton addTarget:self action:@selector(xxy_fullButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.fullScreenButton];
    //
    [self.fullScreenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.bottom.mas_equalTo(self.mas_bottom).offset(10);
    }];

    //时间
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.timeLabel];
}

- (void)xxy_removeFullScreenButton{
    [self.fullScreenButton removeFromSuperview];
    self.fullScreenButton = nil;
    //
    [self.timeLabel removeFromSuperview];
    self.timeLabel = nil;
}

- (void)xxy_setBaseConfig{
    //视图点击手势
    self.callViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xxy_callViewTapHandle:)];
    [self addGestureRecognizer:self.callViewTap];
    //视图右拖动手势
    self.callPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(xxy_swipePanGestureHandle:)];
    [self addGestureRecognizer:self.callPanGesture];
    //
    self.isControlsHidden = NO;
}

- (void)xxy_fullButtonAction{
    //
    [self xxy_removeFullScreenButton];
    [self xxy_setSmallButton];
    
    self.fullScreenButton.selected = !self.fullScreenButton.selected;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(xxy_fullScreentButtonHandle)]) {
        [self.delegate xxy_fullScreentButtonHandle];
    }
}

- (void)xxy_smallButtonAction{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.isSwiping = YES;
        self.state = XXYCallViewStateWindow;
        
        [self xxy_removeSmallButton];
        
        if (!self.isVideo) {
            self.frame = CGRectMake(KScreenBounds.size.width - 15.f - KWindowDisplayWidth, KScreenBounds.size.height - KWindowDisplayHeight - 45.f, KWindowDisplayWidth, KWindowDisplayHeight);
        }else{
            self.frame = CGRectMake(KScreenBounds.size.width - 15.f - KWindowDisplayWidth1, KScreenBounds.size.height - KWindowDisplayHeight1 - 45.f, KWindowDisplayWidth1, KWindowDisplayHeight1);
        }
    }completion:^(BOOL finished) {
        
    }];
}

#pragma mark -- Events 
//切换视图  全屏或小窗口
- (void)xxy_callViewTapHandle:(UITapGestureRecognizer *)callViewTap{
    if (XXYCallViewStateWindow == self.state) {
        [UIView animateWithDuration:.3f animations:^{
            self.frame = KScreenBounds;
        } completion:^(BOOL finished) {
            //
            [self xxy_setSmallButton];
        }];
    }else{
        self.isControlsHidden ? [self startControlsTimer] : [self stopControlsTimer];
        self.isControlsHidden = !self.isControlsHidden;
    }
}
//拖动视图
- (void)xxy_swipePanGestureHandle:(UIPanGestureRecognizer *)panGesture{
    CGPoint translation = [panGesture translationInView:self];
    if (UIGestureRecognizerStateBegan == panGesture.state) {
        if (XXYCallViewStateWindow == self.state && self.isSwiping) {
            [self xxy_startPanCallView];
        }
    }else if (UIGestureRecognizerStateCancelled == panGesture.state || UIGestureRecognizerStateEnded == panGesture.state){
                //
        if (XXYCallViewStateWindow == self.state) {
            [self xxy_endPanPlayerViewWhenWindow];
        }
    }else if (UIGestureRecognizerStateChanged == panGesture.state){
        
        //
        if (XXYCallViewStateWindow == self.state) {
            [self xxy_panPlayerViewWhenWindowWithPanGestureTranslation:translation];
        }
    }
}

//- (void)setState:(XXYCallViewState)state{
//    XXYCallViewState oldState = _state;
//    _state = state;
//    switch (self.state) {
//        
//        case XXYCallViewStateWindow:
//            self.isControlsHidden = YES;
//            [[UIApplication sharedApplication] setStatusBarHidden:NO];
//            [self stopControlsTimer];
//            break;
//        default:
//            break;
//    }
//}

#pragma mark -- ControlsTimer
- (void)startControlsTimer{
    [self stopControlsTimer];
    self.controlsTimer = [NSTimer scheduledTimerWithTimeInterval:KControlsHideInterval target:self selector:@selector(controlsTimerHandle) userInfo:nil repeats:NO];
}

- (void)stopControlsTimer{
    if (self.controlsTimer.isValid) {
        [self.controlsTimer invalidate];
        self.controlsTimer = nil;
    }
}

- (void)controlsTimerHandle{
    if (!self.isControlsHidden) {
        
        self.isControlsHidden = YES;
    }
}

#pragma mark -- PanPlayerViewHandle
- (void)xxy_startPanCallView{
    if (self.isSwiping) {
        return;
    }
    
    self.isSwiping = YES;
}

- (void)xxy_panPlayerViewWhenPortraitWithPanGestureDistance:(CGFloat)distance{
    if (distance <= 0) return;
    if (!self.isSwiping) return;
    
    CGFloat rate = distance / (KScreenBounds.size.width*2);
    
    CGFloat widthPaddign = 15.f;
    CGFloat heightPadding = 45.f;
    
    if (!self.isVideo) {//语音
        [self setFrameOriginX:(KScreenBounds.size.width - widthPaddign - KWindowDisplayWidth) * rate];
        [self setFrameOriginY:(KScreenBounds.size.height - heightPadding - KWindowDisplayHeight) * rate];
    }else{//视频
        [self setFrameOriginX:(KScreenBounds.size.width - widthPaddign - KWindowDisplayWidth1) * rate];
        [self setFrameOriginY:(KScreenBounds.size.height - heightPadding - KWindowDisplayHeight1) * rate];
    }
    
//    [self setFrameOriginX:(KScreenBounds.size.width - widthPaddign - KWindowDisplayWidth) * rate];
//    [self setFrameOriginY:(KScreenBounds.size.height - heightPadding - KWindowDisplayHeight) * rate];
    
    [self setFrameWidth:KScreenBounds.size.width - self.frame.origin.x - (widthPaddign * rate)];
    [self setFrameHeight:KScreenBounds.size.height - self.frame.origin.y - (heightPadding * rate)];
}

- (void)xxy_panPlayerViewWhenWindowWithPanGestureTranslation:(CGPoint)translation{
    self.center = CGPointMake(self.center.x + translation.x, self.center.y + translation.y);
    [self.callPanGesture setTranslation:CGPointZero inView:[UIApplication sharedApplication].delegate.window];
}

- (void)xxy_endPanPlayerViewWhenPortrait{
    if (!self.isSwiping) {
        return;
    }
    //
    if (self.frame.origin.x >= 50.f) {
        self.state = XXYCallViewStateWindow;
        [UIView animateWithDuration:.3 animations:^{
            
            self.frame = CGRectMake(KScreenBounds.size.width - 15.f - KWindowDisplayWidth, KScreenBounds.size.height - KWindowDisplayHeight - 45.f, KWindowDisplayWidth, KWindowDisplayHeight);
        } completion:^(BOOL finished) {
            self.isSwiping = NO;
        }];
    }else{
        [UIView animateWithDuration:.3f animations:^{
            self.frame = KScreenBounds;
        } completion:^(BOOL finished) {
            self.isSwiping = NO;
            [[UIApplication sharedApplication] setStatusBarHidden:YES];
        }];
    }
}

- (void)xxy_endPanPlayerViewWhenWindow{
    if (self.center.x <= KScreenBounds.size.width / 2.f) {
        [UIView animateWithDuration:0.3f animations:^{
            CGPoint center = self.center;
            if (!self.isVideo) {
                center.x = 15.f + KWindowDisplayWidth / 2.f;
            }else{
                center.x = 15.f + KWindowDisplayWidth1 / 2.f;
            }
            
            
            
            if (self.center.y < 15.f + KWindowDisplayHeight / 2.f) {
                center.y = 15.f + KWindowDisplayHeight / 2.f;
            } else if (self.center.y > KScreenBounds.size.height - 15.f - KWindowDisplayHeight / 2.f) {
                center.y = KScreenBounds.size.height - 15.f - KWindowDisplayHeight / 2.f;
            }
            self.center = center;
        }];
    } else {
        [UIView animateWithDuration:0.3f animations:^{
            CGPoint center = self.center;
            if (!self.isVideo) {//语音
                center.x = KScreenBounds.size.width - 15.f - KWindowDisplayWidth / 2.f;
            }else{//视频
                center.x = KScreenBounds.size.width - 15.f - KWindowDisplayWidth1 / 2.f;
            }
            
            if (self.center.y < 15.f + KWindowDisplayHeight / 2.f) {
                center.y = 15.f + KWindowDisplayHeight / 2.f;
            } else if (self.center.y > KScreenBounds.size.height - 15.f - KWindowDisplayHeight / 2.f) {
                center.y = KScreenBounds.size.height - 15.f - KWindowDisplayHeight / 2.f;
            }
            self.center = center;
        }];
    }
}


@end

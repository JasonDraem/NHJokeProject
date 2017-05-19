//
//  FloatViewTool.m
//  截取字符串
//
//  Created by Jason_Xu on 2017/5/14.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import "FloatViewUitl.h"
#import "CallManager.h"

@interface FloatViewUitl ()<CallManagerDelegate>

@property (nonatomic, strong) CallManager *currentCallManager;

@property (nonatomic, assign) BOOL isCalling;

@property (nonatomic, strong) NSArray *oldData;

@property (nonatomic, strong) UIView *currentView;

@end

@implementation FloatViewUitl

+ (instancetype)xxy_shareInstance{
    static FloatViewUitl *floatViewUtil = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        floatViewUtil = [[FloatViewUitl alloc] init];
    });
    return floatViewUtil;
}

- (void)xxy_startCallWithNumbers:(NSArray *)phones isVideo:(BOOL)isVideo isMulti:(BOOL)isMulti isCalled:(BOOL)isCalled{
    
    [self.currentCallManager.callManagerView removeFromSuperview];
    self.currentCallManager = [[CallManager alloc] initWithNumbers:phones isVideo:isVideo isMulti:isMulti isCalled:isCalled];
    self.currentCallManager.callManagerView.frame = [UIScreen mainScreen].bounds;
    self.currentCallManager.delegate = self;
    self.currentCallManager.callManagerView.alpha = .0f;
   
    if (self.isCalling) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"正在..." delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alert show];
        
        self.currentCallManager.phonesArray = self.oldData;
        
        [[UIApplication sharedApplication].delegate.window addSubview:self.currentView];
        self.currentView.alpha = 1.0f;
        
    }else{
        
        [UIView animateWithDuration:.3f animations:^{
            [[UIApplication sharedApplication].delegate.window addSubview:self.currentCallManager.callManagerView];
            self.currentCallManager.callManagerView.alpha = 1.0f;
        } completion:^(BOOL finished) {
            
            self.isCalling = YES;
            self.oldData = phones;
            self.currentView = self.currentCallManager.callManagerView;
            [self.currentCallManager xxy_startCallManagerWithNumbers];
        }];
    }
    //
}

- (void)xxy_dismissCurrentFloatView{
    [UIView animateWithDuration:.3f animations:^{
        self.currentCallManager.callManagerView.alpha = .0f;
        self.isCalling = NO;
    } completion:^(BOOL finished) {
        [self.currentCallManager.callManagerView removeFromSuperview];
        self.currentCallManager = nil;
    }];
}

#pragma mark - CallManagerDelegate
- (void)xxy_endCallButtonHandle{
    
}

@end

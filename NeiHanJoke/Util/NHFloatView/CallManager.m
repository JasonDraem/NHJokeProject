//
//  CallManager.m
//  截取字符串
//
//  Created by Jason_Xu on 2017/5/14.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import "CallManager.h"

@interface CallManager ()<CallManagerViewDelegate>

@end

@implementation CallManager

- (instancetype)initWithNumbers:(NSArray *)phones isVideo:(BOOL)isVideo isMulti:(BOOL)isMulti isCalled:(BOOL)isCalled{
    
    self = [super init];
    if (self) {
        self.phonesArray = phones;
        self.isVideo = isVideo;
        self.isMulti = isMulti;
        self.isCalled = isCalled;
        [self initialize];
    }
    return self;
}

- (void)initialize{
    self.callManagerView = [[CallManagerView alloc] initWithIsVideo:self.isVideo];
    self.callManagerView.delegate = self;
    self.portraitFrame = CGRectMake(0, 0, MIN(KScreenBounds.size.width, KScreenBounds.size.height), MAX(KScreenBounds.size.width, KScreenBounds.size.height));
    self.landscapeFrame = KScreenBounds;
    self.callManagerView.timeLabel.text =self.phonesArray[0];
}

- (void)xxy_startCallManagerWithNumbers{
    
}

#pragma mark - CallManagerViewDelegate
- (void)xxy_fullScreentButtonHandle{

    self.isFullScreen = self.callManagerView.fullScreenButton.selected;
    if (self.isFullScreen) {
        [self performOrientationChange:UIInterfaceOrientationLandscapeRight];
    }else{
        [self performOrientationChange:UIInterfaceOrientationPortrait];
    }
}

#pragma mark -- DeivceOrientation
- (void)performOrientationChange:(UIInterfaceOrientation)deviceOrientation {

    __weak __typeof__(self) weakSelf = self;
    
    [UIView animateWithDuration:0.3f animations:^{
        CGRect viewBoutnds;
        if (UIInterfaceOrientationIsLandscape(deviceOrientation)) {
            viewBoutnds = CGRectMake(0, 0, CGRectGetWidth(self.landscapeFrame), CGRectGetHeight(self.landscapeFrame));
        } else {
            viewBoutnds = CGRectMake(0, 0, CGRectGetWidth(self.portraitFrame), CGRectGetHeight(self.portraitFrame));
        }
        
        weakSelf.callManagerView.bounds = viewBoutnds;
        [weakSelf.callManagerView setFrameOriginX:0.0f];
        [weakSelf.callManagerView setFrameOriginY:0.0f];
        
        CGRect wvFrame = weakSelf.callManagerView.superview.frame;
        if (wvFrame.origin.y > 0) {
            wvFrame.size.height = CGRectGetHeight(KScreenBounds) ;
            wvFrame.origin.y = 0;
            weakSelf.callManagerView.frame = wvFrame;
        }
    } completion:^(BOOL finished) {
        
    }];

    self.callManagerView.fullScreenButton.selected = self.isFullScreen;
}


//- (CGFloat)degreesForOrientation:(UIInterfaceOrientation)deviceOrientation {
//    switch (deviceOrientation) {
//        case UIInterfaceOrientationPortrait:
//            return 0;
//            break;
//        case UIInterfaceOrientationLandscapeRight:
//            return 90;
//            break;
//        case UIInterfaceOrientationLandscapeLeft:
//            return -90;
//            break;
//        case UIInterfaceOrientationPortraitUpsideDown:
//            return 180;
//            break;
//        default:
//            break;
//    }
//    return 0;
//}


@end

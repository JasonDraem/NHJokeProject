//
//  NHUikitTool.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/4.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHUikitTool.h"

@implementation NHUikitTool

+ (UILabel *)nhPublicLabelWithText:(NSString *)text
                         textColor:(UIColor *)textColor
                          textFont:(CGFloat)textFont{
    
    UILabel * nh_PublicLabel = [[UILabel alloc] init];
    nh_PublicLabel.text = text;
    nh_PublicLabel.textColor = textColor;
    nh_PublicLabel.font = [UIFont systemFontOfSize:textFont];
    
    return nh_PublicLabel;
}

+ (UIButton *)nhPublicButtonWithTittle:(NSString *)buttonTitle
                               bgColor:(UIColor *)bgColor
                     layerCornerRadius:(CGFloat)cornerRadius
                    layerMasksToBounds:(BOOL)masksToBounds{
    
    UIButton *nh_PublicButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [nh_PublicButton setTitle:buttonTitle forState:UIControlStateNormal];
    [nh_PublicButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    return nh_PublicButton;
}

+ (UIScrollView *)nhPublicScrollViewWithFrame:(CGRect)frame ContentSize:(CGSize)cgsize{
    
    UIScrollView *nh_PublicSC = [[UIScrollView alloc] initWithFrame:frame];
    
    nh_PublicSC.backgroundColor = [UIColor whiteColor];
    //set contenSize
    nh_PublicSC.scrollEnabled = NO;
    nh_PublicSC.bounces = NO;
    nh_PublicSC.pagingEnabled = YES;
    nh_PublicSC.showsHorizontalScrollIndicator = NO;
    nh_PublicSC.directionalLockEnabled = YES;
    nh_PublicSC.contentSize = cgsize;

    return nh_PublicSC;
}

+ (UISegmentedControl *)nhPublicSegmentControlWithItemTitles:(NSArray *)itemTitles{
    
    UISegmentedControl *nh_PublicSeg = [[UISegmentedControl alloc] initWithItems:itemTitles];
    nh_PublicSeg.multipleTouchEnabled = NO;
    //momentary默认为NO，如果为YES，会立即消失被选中的状态（蓝色)，但不会影响它产生的事件
    //_nhHomeSegmentControl.momentary = YES;
    nh_PublicSeg.selectedSegmentIndex = 0;
    nh_PublicSeg.tintColor = [UIColor brownColor];
    [nh_PublicSeg setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13], NSForegroundColorAttributeName:[UIColor brownColor]} forState:UIControlStateNormal];
    //selectedStatus
    [nh_PublicSeg setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14], NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    [nh_PublicSeg setTintAdjustmentMode:UIViewTintAdjustmentModeAutomatic];

    return nh_PublicSeg;
}

@end

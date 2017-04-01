//
//  NHUikitTool.h
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/4.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NHUikitTool : NSObject

/**
 public label

 @param text text
 @param textColor textColor
 @param textFont textFont
 @return label
 */
+ (UILabel *)nhPublicLabelWithText:(NSString *)text
                         textColor:(UIColor *)textColor
                          textFont:(CGFloat)textFont;


/**
 public button

 @param buttonTitle title
 @param bgColor bgColor
 @param cornerRadius cornerRadius
 @param masksToBounds bool
 @return button
 */
+ (UIButton *)nhPublicButtonWithTittle:(NSString *)buttonTitle
                               bgColor:(UIColor *)bgColor
                     layerCornerRadius:(CGFloat)cornerRadius
                    layerMasksToBounds:(BOOL)masksToBounds;

/**
 public UIScrollView

 @param frame frame
 @param cgsize cgsize
 @return scrollView
 */
+ (UIScrollView *)nhPublicScrollViewWithFrame:(CGRect)frame ContentSize:(CGSize)cgsize;

/**
 public segmentControl

 @param itemTitles itemTitles
 @return segmentControl
 */
+ (UISegmentedControl *)nhPublicSegmentControlWithItemTitles:(NSArray *)itemTitles;
@end

//
//  NHMainTabbar.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2017/4/1.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import "NHMainTabbar.h"
#import "UIView+Common.h"

/* 间隔 */
static CGFloat const SPACEPadding = 10;

@interface NHMainTabbar ()
/* 主页tabbarItem */
@property (nonatomic, strong) UIButton *mainButton;
/* 显示文字 -主页  */
@property (nonatomic, weak) UILabel *label;

@end

@implementation NHMainTabbar

- (instancetype)init{
    self = [super init];
    if (self) {
        //1. 创建主页tabbaritem
        _mainButton = [[UIButton alloc]init];
        //2. 设置普通模式下icon
        [_mainButton setBackgroundImage:[UIImage imageNamed:@"main1.png"] forState:UIControlStateNormal];
        //3. 添加点击操作事件
        [_mainButton addTarget:self action:@selector(mainBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        CGSize newSize = _mainButton.currentBackgroundImage.size;
        _mainButton.frame = CGRectMake(0, 0, newSize.width, newSize.height);
        [self addSubview:_mainButton];
        //文字
        UILabel *label = [[UILabel alloc] init];
        label.text = @"主页";
        label.font = [UIFont systemFontOfSize:11];
        [label sizeToFit];
        label.textColor = [UIColor grayColor];
        self.label = label;
        [self addSubview:self.label];
    }
    return self;
}
//点击事件
- (void)mainBtnClick:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(nh_tabbarDidClickPlusButton:)]) {
        [self.delegate nh_tabbarDidClickPlusButton:self];
    }
}
//重新布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.mainButton.centerX = self.width * 0.5;
    //1. 调整发布按钮的中线点Y值
    self.mainButton.centerY = self.height * 0.5 - 2 * SPACEPadding  ;
    self.label.centerX = self.mainButton.centerX;
    self.label.centerY = CGRectGetMaxY(self.mainButton.frame) + SPACEPadding ;
    
    //2. 系统自带的按钮类型是UITabBarButton，找出这些类型的按钮，然后重新排布位置，空出中间的位置
    Class class = NSClassFromString(@"UITabBarButton");
    
    int btnIndex = 0;
    for (UIView *btn in self.subviews) {//遍历tabbar的子控件
        if ([btn isKindOfClass:class]) {//如果是系统的UITabBarButton，那么就调整子控件位置，空出中间位置
            //每一个按钮的宽度==tabbar的五分之一
            btn.width = self.width / 5;
            
            btn.x = btn.width * btnIndex;
            
            btnIndex++;
            //如果是索引是2(从0开始的)，直接让索引++，目的就是让消息按钮的位置向右移动，空出来发布按钮的位置
            if (btnIndex == 2) {
                btnIndex++;
            }
            
        }
    }
}


//- (void)layoutSubviews{
//    [super layoutSubviews];
//    
//    CGFloat width = self.frame.size.width;
//    CGFloat height = self.frame.size.height;
//    //设置发布按钮的位置
//    _mainButton.center = CGPointMake(width/2, height/2-20);
//    
//    //遍历tabBar的所有控件，并重新布局,中间的位置空出来
//    //系统自带的按钮类型是UITabBarButton
//    Class class = NSClassFromString(@"UITabBarButton");
//    int index = 0;
//    for (UIView *btn in self.subviews) {
//        if ([btn isKindOfClass:class]) {
//            CGRect rect = btn.frame;
//            rect.origin.x = width/5 * index;
//            rect.size.width = width/5;
//            btn.frame = rect;
//            
//            index++;
//            //如果是中间位置，则直接跳过，空出来
//            if (index == 2) {
//                index++;
//            }
//        }
//        
//    }
//}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    /*
     这个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
     self.isHidden == NO 说明当前页面是有tabBar的，那么肯定是再导航控制器的根控制器页面
     在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否再发布按钮身上
     是的话，让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
     
     这里有一个理解的关键点：传动链是从下往上的，也就是从最底层开始往顶层遍历UIResporter的子类
     因为这个框架是UITabBar --  UINavigation -- ViewController -- view，所以Window首先
     是把UIEvent事件传递给UITabBar的，这时重写hitTest方法，拦截事件并返回plusBtn,系统就会继续调用
     plusBtn的hitTest方法遍历其所有的子类，确定事件的第一响应者。
     */
    if (NO == self.isHidden) {
        //将当前tabBar的触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点
        CGPoint newPoint = [self convertPoint:point toView:self.mainButton];
        //判断这个新的点是否在主页按钮身上，若是，那么处理点击事件的最合适的view就是主页按钮
        if ([self.mainButton pointInside:newPoint withEvent:event]) {
            return self.mainButton;
        }else{
            //如果不在发布按钮身上，直接让系统处理就好
            return [super hitTest:point withEvent:event];
        }
    }else{
        //tabBar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return [super hitTest:point withEvent:event];
    }
}





@end

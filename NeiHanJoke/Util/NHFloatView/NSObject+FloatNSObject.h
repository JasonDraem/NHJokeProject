//
//  NSObject+FloatNSObject.h
//  截取字符串
//
//  Created by Jason_Xu on 2017/5/14.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FloatNSObject)
void RUN_ON_UI_THREAD(dispatch_block_t block);

+ (NSString *)timeStringFromSecondsValue:(int)seconds;

@end

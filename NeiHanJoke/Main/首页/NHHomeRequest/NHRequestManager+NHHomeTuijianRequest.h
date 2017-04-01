//
//  NHRequestManager+NHHomeTuijianRequest.h
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/8.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHRequestManager.h"

@interface NHRequestManager (NHHomeTuijianRequest)

/**
 推荐数据

 @param responseBlock <#responseBlock description#>
 */
+ (void)getHomeTuiJianDataResponseObject:(ResponseObjectBlock)responseBlock;
@end

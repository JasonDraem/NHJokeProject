//
//  NHRequestManager+NHHomeVedioRequest.h
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/8.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHRequestManager.h"

@interface NHRequestManager (NHHomeVedioRequest)

/**
 vedio data

 @param responseObjectBlock <#responseObject description#>
 */
+ (void)getNHHomeVedioDataResponseObject:(ResponseObjectBlock)responseObjectBlock;
@end

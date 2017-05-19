//
//  NHRequestManager+NHDiscoverRequestCatogry.h
//  NeiHanJoke
//
//  Created by Jason_Xu on 2017/5/19.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import "NHRequestManager.h"

@interface NHRequestManager (NHDiscoverRequestCatogry)

/**
 url

 @param discoverUrl <#discoverUrl description#>
 */
+ (void)nhDiscoverGetDataWithUrl:(NSString *)discoverUrl responcese:(ResponseObjectBlock)responcese;
@end

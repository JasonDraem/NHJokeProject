//
//  NHRequestManager+NHHomeTuijianRequest.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/8.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHRequestManager+NHHomeTuijianRequest.h"

@implementation NHRequestManager (NHHomeTuijianRequest)
+ (void)getHomeTuiJianDataResponseObject:(ResponseObjectBlock)responseBlock{
    //
    NSMutableString *tuiJianUrlStr = [[NSMutableString alloc] init];
    [tuiJianUrlStr appendFormat:@"%@%@", kNHDomainNameProxy_Api, kNHHome_TuiJianProxyApi];
    NSLog(@"%@", tuiJianUrlStr);
    [[NHRequestManager shareInstance] GET:tuiJianUrlStr parameters:nil success:^(id responseObject, NSError *error) {
        if (!error) {
            NSDictionary *tuiJianDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
            NSLog(@"------->:%@", tuiJianDict);
        }
    } failure:^(id responseObject, NSError *error) {
        
    }];
}
@end

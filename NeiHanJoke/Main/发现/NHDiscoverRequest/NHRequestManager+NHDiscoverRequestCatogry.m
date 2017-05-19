//
//  NHRequestManager+NHDiscoverRequestCatogry.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2017/5/19.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import "NHRequestManager+NHDiscoverRequestCatogry.h"
#import "NHDouBanMovieShowModel.h"
#import <MJExtension/MJExtension.h>

@implementation NHRequestManager (NHDiscoverRequestCatogry)

+ (void)nhDiscoverGetDataWithUrl:(NSString *)discoverUrl responcese:(ResponseObjectBlock)responcese{
    //
    
    discoverUrl = [discoverUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [[NHRequestManager shareInstance] GET:discoverUrl parameters:nil success:^(id responseObject, NSError *error) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NHDouBanMovieShowModel *model = [NHDouBanMovieShowModel mj_objectWithKeyValues:dict];
        
        responcese(model, nil);
        
    } failure:^(id responseObject, NSError *error) {
        
    }];
}
@end

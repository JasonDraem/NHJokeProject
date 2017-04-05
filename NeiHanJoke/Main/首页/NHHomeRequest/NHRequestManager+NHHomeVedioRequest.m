//
//  NHRequestManager+NHHomeVedioRequest.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/8.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHRequestManager+NHHomeVedioRequest.h"
#import "NHHomeVideoModel.h"

@implementation NHRequestManager (NHHomeVedioRequest)
+ (void)getNHHomeVedioDataResponseObject:(ResponseObjectBlock)responseObjectBlock{
    NSMutableString *vedioUrlStr = [[NSMutableString alloc] init];
    [vedioUrlStr appendFormat:@"%@%@%@", kNHDomainNameProxy_Api, kNHHome_VideoProxyApi, @"&iid=5993412956"];
   
    kXXYLog(@"videoUrl------>:%@", vedioUrlStr);
    NHRequestManager  *requestManager = [NHRequestManager shareInstance];
    //[[NHRequestManager shareInstance] clearHttpHeader];
    //[[NHRequestManager shareInstance] setupHttpHeader:<#(NSString *)#>];
    [requestManager GET:vedioUrlStr parameters:nil success:^(id responseObject, NSError *error) {
        if (!error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
            NHHomeVideoModel *model = [[NHHomeVideoModel alloc] init];
            model.message = dict[@"message"];
            NSDictionary *dataDict = dict[@"data"];
            model.has_more = dataDict[@"has_more"];
            model.tip = dataDict[@"tip"];
            //responseObjectBlock(model, error);
            NSArray *dataArr = dataDict[@"data"];
            for (NSDictionary *dict2 in dataArr) {
                NHHomeVideoModel *model = [[NHHomeVideoModel alloc] init];
                model.type = dict2[@"type"];
                if (1 == [model.type integerValue]) {
                    NSDictionary *groupDict = dict2[@"group"];
                    model.mp4_url = groupDict[@"mp4_url"];
                    model.text = groupDict[@"text"];
                    model.title = groupDict[@"title"];
                    NSDictionary *coverImageDict = groupDict[@"medium_cover"];
                    NSArray *urlListArr = coverImageDict[@"url_list"];
                    model.large_coverImage = urlListArr[0][@"url"];
                    model.category_name = groupDict[@"category_name"];
                }else if(5 == [model.type integerValue]){
                    NSDictionary *adDict = dict2[@"ad"];
                    model.display_info = adDict[@"display_info"];
                    model.web_url = adDict[@"web_url"];
                    model.avatar_name = adDict[@"avatar_name"];
                    model.adID = adDict[@"id"];
                    model.display_image_height = adDict[@"display_image_height"];
                    model.display_image_width = adDict[@"display_image_width"];
                    model.adTitle = adDict[@"title"];
                    model.adLabel = adDict[@"label"];
                }
                responseObjectBlock(model, nil);
            }
            //responseObjectBlock();
        }
    } failure:^(id responseObject, NSError *error) {
        
    }];
}
@end

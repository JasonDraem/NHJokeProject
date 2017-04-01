//
//  NHRequestManager.m
//  NeiHanDuanZiJoke
//
//  Created by Jason_Xu on 2016/11/3.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHRequestManager.h"


@implementation NHRequestManager
{
    AFHTTPSessionManager *_afSessionManager;
}

+ (instancetype)shareInstance{
    static NHRequestManager *_requestManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _requestManager = [[NHRequestManager alloc] init];
    });
    return _requestManager;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _afSessionManager = [AFHTTPSessionManager manager];
        _afSessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _afSessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",@"multipart/form-data", nil];
    }
    return self;
}

- (void)setupHttpHeader:(NSString *)token{
    if (kISValidNSString(token)) {
        [_afSessionManager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    }
}

- (void)clearHttpHeader{
    [_afSessionManager.requestSerializer setValue:@"" forHTTPHeaderField:@"token"];
}

- (void)GET:(NSString *)URLString parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure{
    
    [_afSessionManager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(nil, error);
        }
    }];
}

- (void)POST:(NSString *)URLString parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure{
    [_afSessionManager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(nil, error);
        }
    }];
}

- (AFHTTPResponseSerializer *)responseSearalizerWithSerilizerType:(NHResponseSeializerType)serilizerType{
    switch (serilizerType) {
        case NHResponseSeializerTypeDefault:    // default is JSON
            return [AFJSONResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypeJSON:   // JSON
            return [AFJSONResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypeXML:    //XML
            return [AFXMLParserResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypePlist:  //Plist
            return [AFPropertyListResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypeCompound:   //Compound
            return [AFCompoundResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypeImage: // Image
            return [AFImageResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypeData: // Data
            return [AFHTTPResponseSerializer serializer];
            break;
            
            
        default: // 默认解析器为 JSON解析
            return [AFJSONResponseSerializer serializer];
            break;
    }
}

- (void)POST:(NSString *)URLString parameters:(id)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
}

- (void)cancelAllRequests{
    
}

/**
* params

* @return params
 */
- (NSDictionary *)params{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"tag"] = @"joke";
    params[@"iid"] = @"5316804410";
    params[@"os_version"] = @"9.3.4";
    params[@"os_api"] = @"18";
    
    params[@"app_name"] = @"joke_essay";
    params[@"channel"] = @"App Store";
    params[@"device_platform"] = @"iphone";
    params[@"idfa"] = @"832E262C-31D7-488A-8856-69600FAABE36";
    params[@"live_sdk_version"] = @"120";
    
    params[@"vid"] = @"4A4CBB9E-ADC3-426B-B562-9FC8173FDA52";
    params[@"openudid"] = @"cbb1d9e8770b26c39fac806b79bf263a50da6666";
    params[@"device_type"] = @"iPhone 6 Plus";
    params[@"version_code"] = @"5.5.0";
    params[@"ac"] = @"WIFI";
    params[@"screen_width"] = @"1242";
    params[@"device_id"] = @"10752255605";
    params[@"aid"] = @"7";
    params[@"count"] = @"50";
    params[@"max_time"] = [NSString stringWithFormat:@"%.2f", [[NSDate date] timeIntervalSince1970]];

    return params;
}

















@end

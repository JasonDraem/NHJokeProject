//
//  NHRequestManager.h
//  NeiHanDuanZiJoke
//
//  Created by Jason_Xu on 2016/11/3.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

/**
 *  请求数据block
 *
 *  @param responseObject  返回数据
 *  @param error 错误报告
 */

typedef void(^SuccessBlock)(id responseObject, NSError *error);
typedef void(^FailureBlock)(id responseObject, NSError *error);
typedef void(^ResponseObjectBlock)(id, NSError *error);

/**
 数据解析器类型
 */
typedef NS_ENUM(NSUInteger, NHResponseSeializerType) {
    /**
     *  默认类型 JSON  如果使用这个响应解析器类型,那么请求返回的数据将会是JSON格式
     */
    NHResponseSeializerTypeDefault,
    /**
     *  JSON类型 如果使用这个响应解析器类型,那么请求返回的数据将会是JSON格式
     */
    NHResponseSeializerTypeJSON,
    /*
     *  XML类型 如果使用这个响应解析器类型,那么请求返回的数据将会是XML格式
     */
    NHResponseSeializerTypeXML,
    /**
     *  Plist类型 如果使用这个响应解析器类型,那么请求返回的数据将会是Plist格式
     */
    NHResponseSeializerTypePlist,
    /*
     *  Compound类型 如果使用这个响应解析器类型,那么请求返回的数据将会是Compound格式
     */
    NHResponseSeializerTypeCompound,
    /**
     *  Image类型 如果使用这个响应解析器类型,那么请求返回的数据将会是Image格式
     */
    NHResponseSeializerTypeImage,
    /**
     *  Data类型 如果使用这个响应解析器类型,那么请求返回的数据将会是二进制格式
     */
    NHResponseSeializerTypeData
};


@interface NHRequestManager : NSObject

/**
* shareInstance

* @return <#return value description#>
 */
+ (instancetype)shareInstance;

/**
 token
 @param token <#token description#>
 */
- (void)setupHttpHeader:(NSString *)token;

/**
 token
 */
- (void)clearHttpHeader;
/**
 *  GET请求 By NSURLSession
 *
 *  @param URLString  URL
 *  @param parameters 参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
- (void)GET:(NSString *)URLString parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure;

/**
 *  POST请求 By NSURLSession
 *
 *  @param URLString  URL
 *  @param parameters 参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
- (void)POST:(NSString *)URLString parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure;

/**
 *  POST请求 上传数据 By NSURLSession
 *
 *  @param URLString  URL
 *  @param parameters 参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
- (void)POST:(NSString *)URLString
  parameters:(id)parameters
constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> formData))block
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;

- (void)cancelAllRequests;

@end

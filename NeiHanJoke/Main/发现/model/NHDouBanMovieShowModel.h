//
//  NHDouBanMovieShowModel.h
//  NeiHanJoke
//
//  Created by Jason_Xu on 2017/5/19.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

/*********************************** - NHDouBanMovieShowModel - *********************************/

@class NHMovieImageModel;

@interface NHDouBanMovieShowModel : NSObject

/**
 电影热播 正在上映的电影
 */
@property (nonatomic, copy) NSString *showTitle;

/**
 电影总数
 */
@property (nonatomic, copy) NSString *total;

/**
 数组model
 */
@property (nonatomic, strong) NSArray *entries;

@end
/*************************************** - NHEntriesModel - *************************************/
@interface NHEntriesModel : NSObject
/**
 评分
 */
@property (nonatomic, copy) NSString *rating;

/**
 时间
 */
@property (nonatomic, copy) NSString *pubdate;

/**
 电影名
 */
@property (nonatomic, copy) NSString *movieTitle;

/**
 喜欢
 */
@property (nonatomic, copy) NSString *wish;

/**
 电影类型
 */
@property (nonatomic, copy) NSString *original_title;

/**
 收藏数
 */
@property (nonatomic, copy) NSString *collection;

/**
 电影类型
 */
@property (nonatomic, copy) NSString *orignal_title;

/**
 星数
 */
@property (nonatomic, copy) NSString *stars;

/**
 id
 */
@property (nonatomic, copy) NSString *movieId;

@property (nonatomic, strong) NHMovieImageModel *images;

@end


/*************************************** - NHMovieImageModel *************************************/
@interface NHMovieImageModel : NSObject
/**
 大图
 */
@property (nonatomic, copy) NSString *large;

/**
 小图
 */
@property (nonatomic, copy) NSString *small;

/**
 视频图
 */
@property (nonatomic, copy) NSString *medium;

@end















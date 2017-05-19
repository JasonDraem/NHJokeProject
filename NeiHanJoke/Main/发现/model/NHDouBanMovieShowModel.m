//
//  NHDouBanMovieShowModel.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2017/5/19.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import "NHDouBanMovieShowModel.h"

#import <MJExtension/MJExtension.h>

/*********************************** - NHDouBanMovieShowModel - *********************************/
@implementation NHDouBanMovieShowModel
//
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    NSDictionary *dict = @{@"showTitle" : @"title"};
    return dict;
}
//
+ (NSDictionary *)mj_objectClassInArray{
    NSDictionary *dict = @{@"entries" : @"NHEntriesModel"};
    return dict;
}

@end
/*************************************** - NHEntriesModel - *************************************/
@implementation NHEntriesModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    NSDictionary *dict = @{@"movieId" : @"id" , @"movieTitle" : @"title"};
    return dict;
}

@end
/*************************************** - NHMovieImageModel *************************************/
@implementation NHMovieImageModel


@end

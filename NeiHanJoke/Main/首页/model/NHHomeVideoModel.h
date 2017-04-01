//
//  NHHomeVideoModel.h
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/8.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NHHomeVideoModel : NSObject

@property (nonatomic, copy) NSString *message;
@property (nonatomic, assign) BOOL has_more;
@property (nonatomic, copy) NSString *tip;
@property (nonatomic, copy) NSString *mp4_url;
@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *digg_count;
@property (nonatomic, copy) NSString *idStr;
@property (nonatomic, copy) NSString *favorite_count;
@property (nonatomic, copy) NSString *go_detail_count;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *share_url;
@property (nonatomic, copy) NSString *id_str;

@property (nonatomic, copy) NSString *share_count;
@property (nonatomic, copy) NSString *status_desc;
@property (nonatomic, copy) NSString *play_count;
@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, copy) NSString *large_coverImage;
@property (nonatomic, copy) NSString *type;

//ad
@property (nonatomic, copy) NSString *display_info;
@property (nonatomic, copy) NSString *web_url;
@property (nonatomic, copy) NSString *avatar_name;
@property (nonatomic, copy) NSString *adID;

@property (nonatomic, copy) NSString *display_image_height;
@property (nonatomic, copy) NSString *display_image_width;
@property (nonatomic, copy) NSString *adTitle;
@property (nonatomic, copy) NSString *adLabel;

@property (nonatomic, copy) NSString *diplay_image;
@property (nonatomic, copy) NSString *adType;
@property (nonatomic, copy) NSString *button_text;
@property (nonatomic, copy) NSString *avatar_url;



@end

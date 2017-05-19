//
//  NHApi.h
//  NeiHanDuanZiJoke
//
//  Created by Jason_Xu on 2016/11/3.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#ifndef NHApi_h
#define NHApi_h

#define kNHDomainNameProxy_Api              (@"http://ic.snssdk.com/neihan/stream/")

//推荐
#define kNHHome_TuiJianProxyApi             (@"mix/v1/?content_type=-101")

//视频
#define kNHHome_VideoProxyApi               (@"mix/v1/?content_type=-104")

//图片 &iid=5993412956
#define kNHHome_ImagesProxyApi              (@"mix/v1/?content_type=-103")

//段子
#define kNHHome_DuanZiProxyApi              (@"mix/v1/?content_type=-102")

//精华
#define kNHHome_JingHuaProxyApi             (@"")

//同城
#define kNHHome_SameCityProxyApi            (@"mix/v1/?content_type=-201")

//游戏
#define kNHHome_GameProxyApi                (@"")


/** 百思不得姐 **/
#define kBSBDJDomainNameProxy_API           (@"http://api.budejie.com/api/api_open.php?")

//全部
#define kBSBDJAllProxy_API                  (@"a=list&c=data&type=1")
//视频
#define kBSBDJVideoProxy_API                (@"a=list&c=data&type=41")
//声音
#define kBSBDJViceProxy_API                 (@"a=list&c=data&type=31")
//图片
#define kBSBDJPictureProxy_API              (@"a=list&c=data&type=10")
//段子
#define kBSBDJDuanZiProxy_API               (@"a=list&c=data&type=29")

//电影简介
#define kDOUBANMOVIE_API                    (@"http://api.douban.com/v2/movie/nowplaying?app_name=doubanmovie&client=e:iPhone4,1|y:iPhoneOS_6.1|s:mobile|f:doubanmovie_2|v:3.3.1|m:PP_market|udid:aa1b815b8a4d1e961347304e74b9f9593d95e1c5&alt=json&version=2&start=0&city=北京&apikey=0df993c66c0c636e29ecbb5344252a4a")




#endif /* NHApi_h */

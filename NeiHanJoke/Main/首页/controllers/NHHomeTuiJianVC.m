//
//  NHHomeTuiJianVC.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/7.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHHomeTuiJianVC.h"
#import "NHRequestManager.h"
#import "NHRequestManager+NHHomeTuijianRequest.h"

@interface NHHomeTuiJianVC ()

@end

@implementation NHHomeTuiJianVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getDataFromeRemoteSerivce];
}

- (void)getDataFromeRemoteSerivce{
    [NHRequestManager getHomeTuiJianDataResponseObject:^(id responseObject, NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

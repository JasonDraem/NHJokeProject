//
//  NHMainViewController.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2017/4/1.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import "NHMainViewController.h"

@interface NHMainViewController ()

@end

@implementation NHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(nh_popSelf)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)nh_popSelf{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  NHFreshViewController.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2016/11/4.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "NHFreshViewController.h"
#import "FloatViewUitl.h"

@interface NHFreshViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *tf;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation NHFreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    self.tf.backgroundColor = [UIColor redColor];
    self.tf.delegate = self;
    [self.view addSubview:self.tf];
    
   
}

- (void)callAction{
    [[FloatViewUitl xxy_shareInstance] xxy_startCallWithNumbers:self.dataSource isVideo:NO isMulti:NO isCalled:NO];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.tf endEditing:YES];
    [self.dataSource removeAllObjects];
    [self.dataSource addObject:self.tf.text];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"拨号" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(0, 0, 50, 50);
    button.center = self.view.center;
    
    [button addTarget:self action:@selector(callAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    return YES;
}


- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
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

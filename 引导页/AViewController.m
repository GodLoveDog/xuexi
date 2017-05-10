
//
//  AViewController.m
//  引导页
//
//  Created by hejianghai on 2017/4/6.
//  Copyright © 2017年 hejianghai. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView  *v=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    v.center=self.view.center;
    v.backgroundColor=[UIColor greenColor];
    [self.view addSubview:v];
//    self.view.backgroundColor=[UIColor redColor];
    // Do any additional setup after loading the view.
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

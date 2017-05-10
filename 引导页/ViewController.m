//
//  ViewController.m
//  引导页
//
//  Created by hejianghai on 2017/4/5.
//  Copyright © 2017年 hejianghai. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"

@interface ViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property(nonatomic,strong)NSArray  *arr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AViewController  *a=[AViewController new];
    AViewController  *b=[AViewController new];
    AViewController *c=[AViewController new]
    ;
    self.arr=@[a,b,c];
    UIPageViewController *page=[[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    page.view.backgroundColor=[UIColor redColor];
    page.delegate=self;
    page.dataSource=self;
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self addChildViewController:page];
    [self.view addSubview:page.view];
    
    
    [page setViewControllers:@[a] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        NSLog(@"a");
    }];
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return self.arr.count;
}

-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    
    return 0;
    
}
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    if (viewController == [self.arr lastObject]) {
        return nil;
    }
    else
    {
        NSInteger  i=[self.arr indexOfObject:viewController]+1;
        return self.arr[i];
    }
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if (viewController == [self.arr firstObject]) {
        return nil;
    }
    else
    {
        NSInteger  i=[self.arr indexOfObject:viewController]-1;
        return self.arr[i];
    }
}
-(void)viewWillLayoutSubviews
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

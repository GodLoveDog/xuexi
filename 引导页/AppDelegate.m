//
//  AppDelegate.m
//  引导页
//
//  Created by hejianghai on 2017/4/5.
//  Copyright © 2017年 hejianghai. All rights reserved.
//

#import "AppDelegate.h"
#import <OnboardingViewController.h>
#import <OnboardingContentViewController.h>
#import "AViewController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController=[self generateStandardOnboardingVC];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(OnboardingViewController *)generateStandardOnboardingVC
{
//    NSBundle  *bun=[NSBundle mainBundle];
//    NSString  *p=[bun pathForResource:@"sun" ofType:@"mp4"];
//    NSURL  *u=[NSURL fileURLWithPath:p];
    
    OnboardingContentViewController  *first=[OnboardingContentViewController contentWithTitle:@"世界那么大" body:@"我想去看看" videoURL:nil buttonText:@"next" actionBlock:^(OnboardingViewController * _Nonnull onboardController) {
        
        NSLog(@"第一页");
    }];
    first.topPadding=first.view.frame.size.height/2;
    first.underIconPadding=-100;
    first.underTitlePadding=0;
   
    first.movesToNextViewController=YES;
    OnboardingContentViewController  *second=[OnboardingContentViewController contentWithTitle:@"世界那么大" body:@"我想去看看" image:[UIImage imageNamed:@"red"] buttonText:@"进入" action:^{
        NSLog(@"第二页");
        
        ViewController *v=[ViewController new];
        
        self.window.rootViewController=v;
    }];
    second.bottomPadding=-30;
    
    AViewController  *v=[[AViewController alloc]init];
 
    
//    NSBundle  *bundle=[NSBundle mainBundle];
//    NSString  *path=[bundle pathForResource:@"sun" ofType:@"mp4"];
//    NSURL *url=[NSURL fileURLWithPath:path];
    OnboardingViewController  *board=[OnboardingViewController onboardWithBackgroundVideoURL:nil contents:@[first,second,v]];
    board.allowSkipping=YES;
    board.skipHandler = ^{
        NSLog(@"123");
    };
    board.shouldMaskBackground=NO;
    board.shouldBlurBackground=YES;
    board.shouldFadeTransitions=YES;
    board.pageControl.pageIndicatorTintColor=[UIColor redColor];
    board.fadeSkipButtonOnLastPage=YES;
//    board.fadePageControlOnLastPage=YES;
    return board;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

//
//  AppDelegate.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "DesignViewController.h"
#import "CategoryViewController.h"
#import "SearchViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    
    //初始化视图控制器
    [self loadViewControllers];
    [self firstLaunch];
    [self setupUmeng];
    return YES;
}

- (void)setupUmeng
{
    [UMSocialData setAppKey:@"5636fc8d67e58e77b20000a7"];
    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToQQ,UMShareToQzone,UMShareToWechatTimeline]];
}

- (void)loadViewControllers
{
//    UIStoryboard * main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    self.tabbarCtl = [main instantiateViewControllerWithIdentifier:@"MainCTL"];
    self.tabbarCtl = [UITabBarController new];
    HomeViewController * homeCtl = [HomeViewController new];
//    DesignViewController * designCtl = [DesignViewController new];
    CategoryViewController * categoryCtl = [CategoryViewController new];
    SearchViewController * searchCtl = [SearchViewController new];
    UINavigationController * searchNav = [[UINavigationController alloc] initWithRootViewController:searchCtl];
    self.tabbarCtl.viewControllers = @[homeCtl,categoryCtl,searchNav];
    self.tabbarCtl.tabBar.hidden = YES;
    self.tabbarCtl.selectedIndex = 0;
    self.window.rootViewController = self.tabbarCtl;
    
}

- (void)firstLaunch
{
    NSString * flag = [[NSUserDefaults standardUserDefaults]objectForKey:@"firstLaunch"];
    if (flag == nil)
    {
        UIScrollView * firstScr = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ZScreenWidth, ZScreenHeight)];
        firstScr.tag = 10;
        firstScr.contentSize = CGSizeMake(5*ZScreenWidth, ZScreenHeight);
        firstScr.pagingEnabled = YES;
        for (NSInteger i = 0; i < 5; i++)
        {
            UIView * view = [[UIView alloc] initWithFrame:CGRectMake(i*ZScreenWidth, 0, ZScreenWidth, ZScreenHeight)];
            view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
            if (i == 4)
            {
                UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [btn setTitle:@"Wellcome" forState:UIControlStateNormal];
                btn.frame = CGRectMake(0, 0, 90, 50);
                btn.center = CGPointMake(ZScreenWidth/2, ZScreenHeight/2);
                [view addSubview:btn];
                [btn addTarget:self action:@selector(comeIn) forControlEvents:UIControlEventTouchUpInside];
            }
            [firstScr addSubview:view];
        }
        [self.window addSubview:firstScr];
    }

}

- (void)comeIn
{
    [[NSUserDefaults standardUserDefaults]setObject:@"Yes" forKey:@"firstLaunch"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    UIScrollView * firScr = (UIScrollView *)[self.window viewWithTag:10];
    [firScr removeFromSuperview];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

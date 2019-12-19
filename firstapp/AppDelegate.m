//
//  AppDelegate.m
//  firstapp
//
//  Created by ipad on 2019/12/5.
//  Copyright © 2019 ipad. All rights reserved.
//

#import "AppDelegate.h"
#import "NewsViewController.h"
#import "VideosViewController.h"
#import "RecommendViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds] ];
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    tabbarController.delegate = self;
    
    NewsViewController *vc1 = [[NewsViewController alloc] init];
    UINavigationController *navigationController  = [[UINavigationController alloc] initWithRootViewController:vc1];
    navigationController.view.backgroundColor = [UIColor whiteColor];
    navigationController.tabBarItem.title = @"新闻";
    
    VideosViewController *c2 = [[VideosViewController alloc] init];
    
    RecommendViewController *c3 = [[RecommendViewController alloc] init];
    
    UIViewController *c4 = [[UIViewController alloc] init];
    c4.view.backgroundColor = [UIColor lightGrayColor];
    c4.tabBarItem.title = @"我的";
    
    [tabbarController setViewControllers:@[navigationController,c2,c3,c4]];
    
    self.window.rootViewController = tabbarController;
    [self.window makeKeyAndVisible];
    
    return YES;
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

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"did select");
};


@end

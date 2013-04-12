//
//  T4AppDelegate.m
//  UIdea
//
//  Created by Xiaohui on 13-4-3.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4AppDelegate.h"
#import "T4ControllerMap.h"
#import "T4MainViewController.h"
#import "T4SearchViewController.h"

@implementation T4AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (void)registerController
{
    [[T4ControllerMap sharedInstance] registerControllerWithClass:[T4MainViewController class]];
    [[T4ControllerMap sharedInstance] registerControllerWithClass:[T4SearchViewController class]];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = DefViewBGColor;
    self.window.rootViewController = [T4ControllerMap globalNavgationController];
    [self.window makeKeyAndVisible];
    
    [self registerController];
    
    [[T4ControllerMap sharedInstance] showWithClassName:@"T4MainViewController"];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

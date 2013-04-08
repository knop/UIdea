//
//  T4ControllerMap.m
//  UIdea
//
//  Created by Xiaohui on 13-4-7.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4ControllerMap.h"

static UINavigationController *sNavgationController;

@implementation T4ControllerMap

+ (UINavigationController *)globalNavgationController
{
    if (sNavgationController == nil) {
        @synchronized(self) {
            if (sNavgationController == nil) {
                sNavgationController = [[UINavigationController alloc] init];
                [sNavgationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg"]
                                                         forBarMetrics:UIBarMetricsDefault];
            }
        }
    }
    return sNavgationController;
}

SYNTHESIZE_SINGLETON_FOR_CLASS(T4ControllerMap)

- (id)init
{
    self = [super init];
    if (self) {
        _controllerDict = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)addClass:(Class)c
{
    NSString *key = NSStringFromClass(c);
    [_controllerDict setObject:c forKey:key];
}

- (void)show:(NSString *)className
{
    Class c = [_controllerDict objectForKey:className];
    UIViewController *controller = [[c alloc] init];
    [[T4ControllerMap globalNavgationController] pushViewController:controller animated:YES];
    [controller release];
}

@end

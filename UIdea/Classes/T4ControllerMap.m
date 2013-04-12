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

- (void)registerControllerWithClass:(Class)c
{
    NSString *key = NSStringFromClass(c);
    [_controllerDict setObject:c forKey:key];
}

- (void)showWithClassName:(NSString *)className
                    style:(ShowStyle)style
                animation:(AnimationBlock)animation
{
    UINavigationController *navigationController = [T4ControllerMap globalNavgationController];
    if (style == ShowStyleAdd) {
        Class c = [_controllerDict objectForKey:className];
        UIViewController *controller = [[c alloc] init];
        [navigationController addChildViewController:controller];
        [controller release];
        if (animation != nil) {
            animation(controller);
        } else {
            CGSize size = controller.view.frame.size;
            controller.view.frame = CGRectMake(0,20.0f,size.width,size.height);            
        }
        [navigationController.view addSubview:controller.view];
    } else {
        Class c = [_controllerDict objectForKey:className];
        UIViewController *controller = [[c alloc] init];
        [navigationController pushViewController:controller animated:YES];
        [controller release];
    }
}

- (void)showWithClassName:(NSString *)className style:(ShowStyle)style
{
    [self showWithClassName:className style:style animation:nil];
}

- (void)showWithClassName:(NSString *)className
{
    [self showWithClassName:className style:ShowStylePush];
}

@end

//
//  T4ControllerManager.m
//  UIdea
//
//  Created by Xiaohui on 13-4-7.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4ControllerManager.h"
#import "T4MainViewController.h"
#import "T4SearchViewController.h"
#import "T4ProjectViewController.h"

static UINavigationController *sNavgationController;

@implementation T4ControllerManager

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

SYNTHESIZE_SINGLETON_FOR_CLASS(T4ControllerManager)

- (id)init
{
    self = [super init];
    if (self) {
        _controllerDict = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)registerControllers
{
    [self registerControllerWithClass:[T4MainViewController class]];
    [self registerControllerWithClass:[T4SearchViewController class]];
    [self registerControllerWithClass:[T4ProjectViewController class]];
}

- (void)registerControllerWithClass:(Class)c
{
    NSString *key = NSStringFromClass(c);
    [_controllerDict setObject:c forKey:key];
}

- (void)showWithClassName:(NSString *)className
{
    [self showWithClassName:className
                     object:nil];
}

- (void)showWithClassName:(NSString *)className
                   object:(id)object
{
    [self showWithClassName:className
                      style:ShowStylePush
                     object:object];
}

- (void)showWithClassName:(NSString *)className
                    style:(ShowStyle)style
{
    [self showWithClassName:className
                      style:style
                     object:nil];
}

- (void)showWithClassName:(NSString *)className
                    style:(ShowStyle)style
                   object:(id)object
{
    [self showWithClassName:className
                      style:style
                  animation:nil
                     object:object];
}

- (void)showWithClassName:(NSString *)className
                    style:(ShowStyle)style
                animation:(AnimationBlock)animation
{
    [self showWithClassName:className
                      style:style
                  animation:animation
                     object:nil];
}

- (void)showWithClassName:(NSString *)className
                    style:(ShowStyle)style
                animation:(AnimationBlock)animation
                   object:(id)object
{
    Class c = [_controllerDict objectForKey:className];
    if (c == nil || ![c isSubclassOfClass:[T4ViewController class]]) {
        return;
    }
    T4ViewController *controller = [[c alloc] initWithObject:object];
    UINavigationController *navigationController = [T4ControllerManager globalNavgationController];
    if (style == ShowStyleAdd) {       
        [navigationController addChildViewController:controller];
        if (animation != nil) {
            animation(controller);
        } else {
            CGSize size = controller.view.frame.size;
            controller.view.frame = CGRectMake(0,20.0f,size.width,size.height);            
        }
        [navigationController.view addSubview:controller.view];
    } else {
        [navigationController pushViewController:controller
                                        animated:YES];
    }
    [controller release];
}

@end

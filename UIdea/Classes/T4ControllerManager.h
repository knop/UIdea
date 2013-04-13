//
//  T4ControllerManager.h
//  UIdea
//
//  Created by Xiaohui on 13-4-7.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

typedef enum {
    ShowStylePush,
    ShowStyleAdd,
} ShowStyle;

typedef void (^AnimationBlock)(UIViewController *controller);

@interface T4ControllerManager : NSObject
{
    NSMutableDictionary *_controllerDict;
}

@property (nonatomic, retain) UIViewController *currentController;

SYNTHESIZE_SINGLETON_FOR_HEADER(T4ControllerManager)

+ (UINavigationController *)globalNavgationController;

- (void)registerControllers;
//- (void)registerControllerWithClass:(Class)c;
- (void)showWithClassName:(NSString *)className;
- (void)showWithClassName:(NSString *)className
                    style:(ShowStyle)style;
- (void)showWithClassName:(NSString *)className
                    style:(ShowStyle)style
                animation:(AnimationBlock)animation;

@end

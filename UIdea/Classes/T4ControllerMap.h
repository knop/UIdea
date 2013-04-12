//
//  T4ControllerMap.h
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

@interface T4ControllerMap : NSObject
{
    NSMutableDictionary *_controllerDict;
}

SYNTHESIZE_SINGLETON_FOR_HEADER(T4ControllerMap)

+ (UINavigationController *)globalNavgationController;

- (void)registerControllerWithClass:(Class)c;
- (void)showWithClassName:(NSString *)className;
- (void)showWithClassName:(NSString *)className
                    style:(ShowStyle)style;
- (void)showWithClassName:(NSString *)className
                    style:(ShowStyle)style
                animation:(AnimationBlock)animation;

@end

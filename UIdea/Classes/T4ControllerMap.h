//
//  T4ControllerMap.h
//  UIdea
//
//  Created by Xiaohui on 13-4-7.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SynthesizeSingleton.h"

@interface T4ControllerMap : NSObject
{
    NSMutableDictionary *_controllerDict;
}

SYNTHESIZE_SINGLETON_FOR_HEADER(T4ControllerMap)

+ (UINavigationController *)globalNavgationController;

- (void)registerControllerWithClass:(Class)c;
- (void)showWithClassName:(NSString *)className;

@end

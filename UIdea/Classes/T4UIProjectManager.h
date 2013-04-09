//
//  T4UIProjectManager.h
//  UIdea
//
//  Created by Xiaohui on 13-4-9.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SynthesizeSingleton.h"

@interface T4UIProjectManager : NSObject

SYNTHESIZE_SINGLETON_FOR_HEADER(T4UIProjectManager)

@property (nonatomic, retain, readonly) NSMutableArray *projects;

- (void)addProject;

- (NSUInteger)projectCount;

@end

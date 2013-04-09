//
//  T4UIProjectManager.h
//  UIdea
//
//  Created by Xiaohui on 13-4-9.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

@interface T4UIProjectManager : NSObject

@property (nonatomic, retain, readonly) NSMutableArray *projects;

- (void)addProject;

- (NSUInteger)projectCount;

@end

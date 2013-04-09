//
//  T4UIProjectManager.m
//  UIdea
//
//  Created by Xiaohui on 13-4-9.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4UIProjectManager.h"
#import "T4UIProject.h"

@implementation T4UIProjectManager

SYNTHESIZE_SINGLETON_FOR_CLASS(T4UIProjectManager)

- (id)init
{
    self = [super init];
    if (self) {
        _projects = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addProject
{
    static NSUInteger count = 0;
    T4UIProject *project = [[T4UIProject alloc] init];
    project.name = [NSString stringWithFormat:@"Demo %d", count++];
    project.description = [NSString stringWithFormat:@"Demo %d description", count++];
    project.viewCount = 0;
    [_projects addObject:project];    
    [project release];
}

- (NSUInteger)projectCount
{
    return _projects.count;
}

- (void)dealloc
{
    [_projects release];
    [super dealloc];
}

@synthesize projects = _projects;

@end

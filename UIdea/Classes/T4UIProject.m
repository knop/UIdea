//
//  T4UIProject.m
//  UIdea
//
//  Created by Xiaohui on 13-4-9.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4UIProject.h"

@implementation T4UIProject

- (id)init
{
    self = [super init];
    if (self) {
        _subProjects = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    T4_RELEASE_SAFELY(_name);
    T4_RELEASE_SAFELY(_description);
    T4_RELEASE_SAFELY(_subProjects);
    [super dealloc];
}

- (void)addSubProjects
{
    static NSUInteger count = 10;
    T4UIProject *project = [[T4UIProject alloc] init];
    
    project.name = [NSString stringWithFormat:@"Demo %d", count];
    project.description = [NSString stringWithFormat:@"Demo %d description", count];
    project.viewCount = 0;
    [_subProjects addObject:project];
    count++;
    [project release];
}

+ (T4UIProject *)castFromObject:(id)object
{
    T4UIProject *project = nil;
    if (object && [object isKindOfClass:[T4UIProject class]]) {
         project = (T4UIProject *)object;
    }
    return project;
}

@synthesize name = _name;
@synthesize description = _description;
@synthesize subProjects = _subProjects;
@synthesize viewCount = _viewCount;
@synthesize createTime = _createTime;
@synthesize updateTime = _updateTime;

@end

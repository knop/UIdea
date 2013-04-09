//
//  T4UIProject.m
//  UIdea
//
//  Created by Xiaohui on 13-4-9.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4UIProject.h"

@implementation T4UIProject

- (void)dealloc
{
    T4_RELEASE_SAFELY(_name);
    T4_RELEASE_SAFELY(_description);
    [super dealloc];
}

@synthesize name = _name;
@synthesize description = _description;
@synthesize viewCount = _viewCount;

@end

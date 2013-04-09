//
//  T4UIViewData.m
//  UIdea
//
//  Created by Xiaohui on 13-4-8.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4UIViewData.h"

@implementation T4UIViewData

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"T4View";
        self.viewType = T4View;
    }
    return self;
}

- (void)dealloc
{
    T4_RELEASE_SAFELY(_name);
    T4_RELEASE_SAFELY(_link);
    T4_RELEASE_SAFELY(_description);
    T4_RELEASE_SAFELY(_child);
    [super dealloc];
}

@synthesize viewType = _viewType;
@synthesize name = _name;
@synthesize x = _x;
@synthesize y = _y;
@synthesize width = _width;
@synthesize height = _height;
@synthesize child = _child;
@synthesize link = _link;
@synthesize description = _description;

@end

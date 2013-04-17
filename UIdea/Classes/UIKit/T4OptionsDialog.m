//
//  T4OptionsDialog.m
//  UIdea
//
//  Created by Xiaohui on 13-4-18.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4OptionsDialog.h"

@implementation T4OptionsDialog

- (id)init
{
    self = [super init];
    if (self) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"options_dialog_bg"]];
        
        [self addSubview:imageView];
        
        [imageView release];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end

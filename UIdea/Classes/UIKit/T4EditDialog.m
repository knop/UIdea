//
//  T4EditDialog.m
//  UIdea
//
//  Created by Xiaohui on 13-4-18.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4EditDialog.h"

@implementation T4EditDialog

- (UIView *)setupView
{
    UIImage *bgImage = [UIImage imageNamed:@"edit_dialog_bg"];
    CGRect rect = CGRectMake(0, 0, CGImageGetWidth(bgImage.CGImage) / 2.0f,
                             CGImageGetHeight(bgImage.CGImage) / 2.0f);
    UIView *view = [[[UIView alloc] initWithFrame:rect] autorelease];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
    [view addSubview:bgImageView];
    [bgImageView release];
    return view;
}

@end

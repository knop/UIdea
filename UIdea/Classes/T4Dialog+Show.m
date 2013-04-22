//
//  T4Dialog+T4Dialog_Show.m
//  UIdea
//
//  Created by Xiaohui on 13-4-21.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4Dialog+Show.h"
#import "T4EditDialog.h"
#import "T4OptionsDialog.h"

@implementation T4Dialog (Show)

+ (void)showEditDialog
{
    T4EditDialog *dialog = [[[T4EditDialog alloc] init] autorelease];
    [dialog show];
}

+ (void)showOptionsDialog
{
    T4OptionsDialog *dialog = [[[T4OptionsDialog alloc] init] autorelease];
    [dialog show];
}

@end

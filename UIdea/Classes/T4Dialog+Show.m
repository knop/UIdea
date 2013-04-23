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

+ (void)showEditDialogWithDelegate:(id)delegate
{
    T4EditDialog *dialog = [[[T4EditDialog alloc] initWithDelegate:delegate] autorelease];
    [dialog show];
}

+ (void)showOptionsDialogWithDelegate:(id)delegate
{
    T4OptionsDialog *dialog = [[[T4OptionsDialog alloc] initWithDelegate:delegate] autorelease];
    [dialog show];
}

@end

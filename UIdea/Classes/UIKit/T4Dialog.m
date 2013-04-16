//
//  T4Dialog.m
//  UIdea
//
//  Created by Xiaohui on 13-4-16.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4Dialog.h"

@implementation T4Dialog

- (id)initWithBuilder:(T4DialogBuilder *)newBuilder
{
    self = [super init];
    if (self) {
        // Initialization code
        _builder = [newBuilder retain];
        [self initView];
        
    }
    return self;
}

- (void)dealloc
{
    T4_RELEASE_SAFELY(_builder);
    [super dealloc];
}

- (void)initView
{
    switch (_builder.dialogType) {
        case T4DialogTypeEdit:
            [self initEditDialog];
            break;
        case T4DialogTypeOptions:
            [self initOptionsDialog];
            break;            
        default:
            [self initDefaultDialog];
            break;
    }
}

- (void)initEditDialog
{
    
}

- (void)initOptionsDialog
{
    
}

- (void)initDefaultDialog
{
    
}

- (void)show
{
    
}

+ (void)showEditDialog
{
    
}

+ (void)showOptionsDialog
{
    
}

@end

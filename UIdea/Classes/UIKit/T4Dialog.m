//
//  T4Dialog.m
//  UIdea
//
//  Created by Xiaohui on 13-4-16.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4Dialog.h"
#import "T4OptionsDialog.h"

@implementation T4DialogBuilder



@end

@implementation T4DialogBuilder(method)

- (T4Dialog *)create
{
    return [[[T4Dialog alloc] initWithBuilder:self] autorelease];
}

@end

@implementation T4Dialog

- (id)initWithBuilder:(T4DialogBuilder *)newBuilder
{
    self = [super initWithFrame:CGRectMake(0, 0, 320, 460)];
    if (self) {
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
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _center = window.center;
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
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"edit_dialog_bg"]];
    bgImageView.center = _center;
    [self addSubview:bgImageView];
    [bgImageView release];
}

- (void)initOptionsDialog
{
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"options_dialog_bg"]];
    bgImageView.center = _center;
    [self addSubview:bgImageView];
    [bgImageView release];
}

- (void)initDefaultDialog
{
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"edit_dialog_bg"]];
    bgImageView.center = _center;
    [self addSubview:bgImageView];
    [bgImageView release];
}

- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.center = window.center;
    [window addSubview:self];
    
    UIView* view = [[UIApplication sharedApplication] keyWindow].rootViewController.view;
    [view endEditing:YES];
    CGFloat max = MAX([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    CGRect coverRect = CGRectMake(0, 0, max, max);
    UIView *coverView = [[[UIView alloc] initWithFrame:coverRect] autorelease];
    coverView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    [view addSubview:coverView];
    [view addSubview:self];
}

+ (void)showEditDialog
{
    T4DialogBuilder *builder = [[[T4DialogBuilder alloc] init] autorelease];
    builder.dialogType = T4DialogTypeEdit;
    [[builder create] show];
}

+ (void)showOptionsDialog
{
    T4DialogBuilder *builder = [[T4DialogBuilder alloc] init];
    builder.dialogType = T4DialogTypeEdit;
    T4Dialog *dialog = [[[T4Dialog alloc] initWithBuilder:builder] autorelease];
    [builder release];
    [dialog show];
}

@end

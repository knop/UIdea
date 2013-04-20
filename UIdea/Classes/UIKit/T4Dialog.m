//
//  T4Dialog.m
//  UIdea
//
//  Created by Xiaohui on 13-4-16.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4Dialog.h"
#import "T4OptionsDialog.h"
#import "T4EditDialog.h"

@implementation T4Dialog

- (id)init
{
    if (self) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        _coverView = [[UIView alloc] initWithFrame:window.frame];
        _coverView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        [window addSubview:_coverView];
    }
    return self;
}

- (void)dealloc
{
    T4_RELEASE_SAFELY(_contentView);
    T4_RELEASE_SAFELY(_coverView);
    [super dealloc];
}

- (UIView *)setupView
{
    return nil;
}

- (void)tapRecognizerEvent:(UIGestureRecognizer *)recognizer
{
    if(recognizer.state == UIGestureRecognizerStateEnded) {
        [self dismiss];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
       shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isKindOfClass:[UIButton class]]) {
        return NO;
    } else {
        return YES;
    }
}

- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _contentView = [[self setupView] retain];
    _contentView.center = window.center;
    
    UITapGestureRecognizer *tapRecognizer =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(tapRecognizerEvent:)];
    tapRecognizer.delegate = self;
    [window addGestureRecognizer:tapRecognizer];
    [tapRecognizer release];
    
    [window addSubview:_contentView];
}

- (void)dismiss
{
    [_coverView removeFromSuperview];
    [_contentView removeFromSuperview];
}

@end

@implementation T4Dialog(StaticMethod)

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

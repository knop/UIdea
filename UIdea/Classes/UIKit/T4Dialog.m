//
//  T4Dialog.m
//  UIdea
//
//  Created by Xiaohui on 13-4-16.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4Dialog.h"

@implementation T4Dialog

- (id)init
{
    self = [super init];
    if (self) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        self.frame = window.frame;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        [window addSubview:self];
        
        _center = window.center;
    }
    return self;
}

- (id)initWithDelegate:(id)delegate
{
    self = [self init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (void)dealloc
{
    T4_RELEASE_SAFELY(_contentView);
    [super dealloc];
}

- (CGPoint)center
{
    return _center;
}

- (UIView *)setupView
{
    return nil;
}

- (void)dialogWillShow
{
    
}

- (void)dialogDidShow
{
    
}

- (void)dialogWillDismiss
{
    
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
    [self dialogWillShow];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _contentView = [[self setupView] retain];
    _contentView.center = [self center];
    if (_enableTapRecognizer) {
        UITapGestureRecognizer *tapRecognizer =
            [[UITapGestureRecognizer alloc] initWithTarget:self
                                                    action:@selector(tapRecognizerEvent:)];
        tapRecognizer.delegate = self;
        [self addGestureRecognizer:tapRecognizer];
        [tapRecognizer release];
    }
    [window addSubview:_contentView];
    [self dialogDidShow];
}

- (void)dismiss
{
    [self dialogWillDismiss];
    [_contentView removeFromSuperview];
    [self removeFromSuperview];
}

@synthesize delegate = _delegate;
@synthesize enableTapRecognizer = _enableTapRecognizer;

@end

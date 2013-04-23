//
//  T4Dialog.h
//  UIdea
//
//  Created by Xiaohui on 13-4-16.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface T4Dialog : UIView<UIGestureRecognizerDelegate>
{
    UIView *_contentView;
    UIView *_coverView;
    CGPoint _center;
}

@property (nonatomic) BOOL enableTapRecognizer;
@property (nonatomic, assign) id delegate;

- (id)initWithDelegate:(id)delegate;
- (void)show;
- (void)dismiss;

@end
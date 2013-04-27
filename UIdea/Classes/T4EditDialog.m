//
//  T4EditDialog.m
//  UIdea
//
//  Created by Xiaohui on 13-4-18.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4EditDialog.h"

@implementation T4EditDialog

- (void)dealloc
{
    [_nameTextField release];
    [super dealloc];
}

- (UIView *)setupView
{
    UIImage *bgImage = [UIImage imageNamed:@"edit_dialog_bg"];
    CGRect rect = CGRectMake(0, 0, CGImageGetWidth(bgImage.CGImage) / 2.0f,
                             CGImageGetHeight(bgImage.CGImage) / 2.0f);
    UIView *view = [[[UIView alloc] initWithFrame:rect] autorelease];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
    [view addSubview:bgImageView];
    [bgImageView release];
    
    CGFloat width = 198.0f;
    CGFloat height = 30.0f;
    CGFloat x = (rect.size.width - width) / 2.0f;
    CGFloat y = 20.0f;
    rect = CGRectMake(x, y, width, height);
    UIImage *inputBgImage = [UIImage imageNamed:@"edit_dialog_input_bg"];
    UIImageView *inputBgImageView = [[UIImageView alloc] initWithImage:inputBgImage];
    inputBgImageView.frame = rect;
    [view addSubview:inputBgImageView];
    [inputBgImageView release];
    CGFloat offset = 5.0f;
    rect = CGRectMake(x + offset, y + offset, width, height);
    _nameTextField = [[UITextField alloc] initWithFrame:rect];
    _nameTextField.placeholder = @"请输入名称";
    _nameTextField.borderStyle = UITextBorderStyleNone;
    [view addSubview:_nameTextField];
    
    y = y + height + 17.0f;
    height = 32.0f;
    UIButton *okButton = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
    [okButton setTitle:@"确认" forState:UIControlStateNormal];
    [okButton setBackgroundImage:[UIImage imageNamed:@"edit_dialog_button_normal"]
                           forState:UIControlStateNormal];
    [okButton setBackgroundImage:[UIImage imageNamed:@"edit_dialog_button_press"]
                           forState:UIControlStateHighlighted];
    [okButton addTarget:self
                 action:@selector(onClickOK:)
       forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:okButton];
    [okButton release];
    
    return view;
}

- (CGPoint)center
{
    CGPoint center = [super center];
    return CGPointMake(center.x, center.y - 70.0f);
}

- (void)dialogDidShow
{
    [_nameTextField becomeFirstResponder];
}

- (void)onClickOK:(id)sender
{
    T4_LOG_P_FUNC;
    if (self.delegate && [self.delegate respondsToSelector:@selector(editDoneWithText:)]) {
        [self.delegate performSelector:@selector(editDoneWithText:)
                            withObject:_nameTextField.text];
    }
    [self dismiss];
}

@end

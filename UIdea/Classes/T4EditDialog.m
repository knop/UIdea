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
    
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(55.0f, 50.0f, 198.0f, 30.0f)];
    _nameTextField.placeholder = @"请输入名称";
    _nameTextField.borderStyle = UITextBorderStyleBezel;
    [view addSubview:_nameTextField];
    
    UIButton *okButton = [[UIButton alloc] initWithFrame:CGRectMake(55.0f, 95.0f, 198.0f, 32.0f)];
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

- (void)beforeShow
{
    
}

- (void)afterShow
{
    [_nameTextField becomeFirstResponder];
}

- (void)onClickOK:(id)sender
{
    T4_LOG_P_FUNC;
}

@end

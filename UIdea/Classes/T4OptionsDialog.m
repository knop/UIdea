//
//  T4OptionsDialog.m
//  UIdea
//
//  Created by Xiaohui on 13-4-18.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4OptionsDialog.h"

@implementation T4OptionsDialog

- (void)dialogWillShow
{
    self.enableTapRecognizer = YES;
}

- (UIView *)setupView
{
    UIImage *bgImage = [UIImage imageNamed:@"options_dialog_bg"];
    CGRect rect = CGRectMake(0, 0, CGImageGetWidth(bgImage.CGImage) / 2.0f,
                             CGImageGetHeight(bgImage.CGImage) / 2.0f);
    UIView *view = [[[UIView alloc] initWithFrame:rect] autorelease];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
    [view addSubview:bgImageView];
    [bgImageView release];
    
    CGFloat x = 0.0f;
    CGFloat y = 0.0f;
    CGFloat width = rect.size.width;
    CGFloat height = 37.0f;
    rect = CGRectMake(x, y, width, height);
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:rect];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"添加设计稿";
    titleLabel.textColor = DefFontColor6;
    titleLabel.shadowColor = DefShadowColor3;
    titleLabel.shadowOffset = DefShadowOffset1;
    titleLabel.font = DefFont30;
    [view addSubview:titleLabel];
    [titleLabel release];
    
    x = 41.0f;
    y = y + height + 16.0f;
    width = 40.0f;
    height = 40.0f;
    rect = CGRectMake(x, y, width, height);
    UIButton *albumButton = [[UIButton alloc] initWithFrame:rect];
    [albumButton setBackgroundImage:[UIImage imageNamed:@"design_btn_album_normal"]
                           forState:UIControlStateNormal];
    [albumButton setBackgroundImage:[UIImage imageNamed:@"design_btn_album_press"]
                           forState:UIControlStateHighlighted];
    [albumButton addTarget:self
                    action:@selector(onClickAlbum:)
          forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:albumButton];
    [albumButton release];
    
    x = x + width + 41.0f;
    rect = CGRectMake(x, y, width, height);
    UIButton *cameraButton = [[UIButton alloc] initWithFrame:rect];
    [cameraButton setBackgroundImage:[UIImage imageNamed:@"design_btn_camera_normal"]
                            forState:UIControlStateNormal];
    [cameraButton setBackgroundImage:[UIImage imageNamed:@"design_btn_camera_press"]
                            forState:UIControlStateHighlighted];
    [cameraButton addTarget:self
                     action:@selector(onClickCamera:)
           forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:cameraButton];
    [cameraButton release];

    x = x + width + 41.0f;
    rect = CGRectMake(x, y, width, height);
    UIButton *widgetButton = [[UIButton alloc] initWithFrame:rect];
    [widgetButton setBackgroundImage:[UIImage imageNamed:@"design_btn_widget_normal"]
                           forState:UIControlStateNormal];
    [widgetButton setBackgroundImage:[UIImage imageNamed:@"design_btn_widget_press"]
                           forState:UIControlStateHighlighted];
    [widgetButton addTarget:self
                     action:@selector(onClickWidget:)
           forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:widgetButton];
    [widgetButton release];
    return view;
}

- (void)onClickAlbum:(id)sender
{
    T4_LOG_P_FUNC;
    if (self.delegate && [self.delegate respondsToSelector:@selector(onClickAlbum:)]) {
        [self.delegate performSelector:@selector(onClickAlbum:)
                            withObject:nil];
    }
    [self dismiss];
}

- (void)onClickCamera:(id)sender
{
    T4_LOG_P_FUNC;
    if (self.delegate && [self.delegate respondsToSelector:@selector(onClickCamera:)]) {
        [self.delegate performSelector:@selector(onClickCamera:)
                            withObject:nil];
    }
    [self dismiss];
}

- (void)onClickWidget:(id)sender
{
    T4_LOG_P_FUNC;
    if (self.delegate && [self.delegate respondsToSelector:@selector(onClickWidget:)]) {
        [self.delegate performSelector:@selector(onClickWidget:)
                            withObject:nil];
    }
    [self dismiss];
}

@end

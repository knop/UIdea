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
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 28.0f, rect.size.width, 37.0f)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"添加设计稿";
    titleLabel.textColor = DefFontColor6;
    titleLabel.shadowColor = DefShadowColor3;
    titleLabel.shadowOffset = DefShadowOffset1;
    titleLabel.font = DefFont30;
    [view addSubview:titleLabel];
    [titleLabel release];
    
    UIButton *albumButton = [[UIButton alloc] initWithFrame:CGRectMake(60.0f, 82.0f, 40.0f, 40.0f)];
    [albumButton setBackgroundImage:[UIImage imageNamed:@"design_btn_album_normal"]
                           forState:UIControlStateNormal];
    [albumButton setBackgroundImage:[UIImage imageNamed:@"design_btn_album_press"]
                           forState:UIControlStateHighlighted];
    [albumButton addTarget:self
                    action:@selector(onClickAlbum:)
          forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:albumButton];
    [albumButton release];

    UIButton *cameraButton = [[UIButton alloc] initWithFrame:CGRectMake(140.0f, 82.0f, 40.0f, 40.0f)];
    [cameraButton setBackgroundImage:[UIImage imageNamed:@"design_btn_camera_normal"]
                            forState:UIControlStateNormal];
    [cameraButton setBackgroundImage:[UIImage imageNamed:@"design_btn_camera_press"]
                            forState:UIControlStateHighlighted];
    [cameraButton addTarget:self
                     action:@selector(onClickCamera:)
           forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:cameraButton];
    [cameraButton release];

    UIButton *widgetButton = [[UIButton alloc] initWithFrame:CGRectMake(220.0f, 82.0f, 40.0f, 40.0f)];
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

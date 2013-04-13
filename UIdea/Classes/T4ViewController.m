//
//  T4ViewController.m
//  UIdea
//
//  Created by Xiaohui on 13-4-8.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4ViewController.h"

@implementation T4ViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"UIdea";
    self.leftNavButtonType = NavButtonBack;
    self.view.backgroundColor = DefViewBGColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIBarButtonItem *)createNavButtonWithType:(NavButtonType)type
{
    UIImage *normalIcon = nil;
    switch (type) {
        case NavButtonBack:
            normalIcon = [UIImage imageNamed:@"nav_bar_image_back"];
            break;
        case NavButtonAdd:
            normalIcon = [UIImage imageNamed:@"nav_bar_image_add"];
            break;
        case NavButtonSetting:
            normalIcon = [UIImage imageNamed:@"nav_bar_image_setting"];
            break;
        default:
            break;
    }
    
    if (normalIcon == nil) {
        return nil;
    }
    
    UIImage *normalImage = [UIImage imageNamed:@"nav_bar_button_normal"];
    UIImage *pressImage = [UIImage imageNamed:@"nav_bar_button_press"];
    
    CGFloat width = CGImageGetWidth(normalImage.CGImage) / 2.0f;
    CGFloat height = CGImageGetHeight(normalImage.CGImage) / 2.0f;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, width, height)];
    [button setBackgroundImage:normalImage forState:UIControlStateNormal];
    [button setBackgroundImage:pressImage forState:UIControlStateHighlighted];
    [button setImage:normalIcon forState:UIControlStateNormal];
    [button setImage:normalIcon forState:UIControlStateHighlighted];
    
    UIBarButtonItem *item = [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
    [button release];
    return item;
}

- (void)setLeftNavButtonType:(NavButtonType)type
{
    _leftNavButtonType = type;
    UIBarButtonItem *item = [self createNavButtonWithType:type];
    self.navigationItem.leftBarButtonItem = item;
    if (item != nil) {
        UIButton *button = (UIButton *)item.customView;
        [button addTarget:self
                   action:@selector(onClickLeftNavBarButton)
         forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)setRightNavButtonType:(NavButtonType)type
{
    _rightNavButtonType = type;
    UIBarButtonItem *item = [self createNavButtonWithType:type];
    self.navigationItem.rightBarButtonItem = item;
    if (item != nil) {
        UIButton *button = (UIButton *)item.customView;
        [button addTarget:self
                   action:@selector(onClickRightNavBarButton)
         forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)onClickLeftNavBarButton
{
    NSLog(@"father-onClickLeftNavBarButton");
    if (_leftNavButtonType == NavButtonBack) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)onClickRightNavBarButton
{
    NSLog(@"father-onClickRightNavBarButton");
    if (_rightNavButtonType == NavButtonBack) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@synthesize leftNavButtonType = _leftNavButtonType;
@synthesize rightNavButtonType = _rightNavButtonType;

@end

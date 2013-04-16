//
//  T4ViewController.m
//  UIdea
//
//  Created by Xiaohui on 13-4-8.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4ViewController.h"

@implementation T4ViewController

- (id)init
{
    self = [super init];
    if (self) {
        CGRect rect = CGRectMake(0, 0, 200, 44);
        
        UIView *view = [[UIView alloc] initWithFrame:rect];
        _titleLabel = [[UILabel alloc] initWithFrame:rect];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"UIdea";
        _titleLabel.textColor = DefTitleColor;
        _titleLabel.shadowColor = DefShadowColor2;
        _titleLabel.shadowOffset = DefShadowOffset1;
        _titleLabel.font = DefFont40;
        [view addSubview:_titleLabel];
        
        self.navigationItem.titleView = view;
        [view release];
    }
    
    return self;
}

- (void)dealloc
{
    T4_RELEASE_SAFELY(_titleLabel);
    T4_RELEASE_SAFELY(_clickableView);
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

- (void)setClickable:(BOOL)clickable
{
    _clickable = clickable;
    if (_clickable) {
        CGRect parentViewFrame = self.navigationItem.titleView.frame;
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav_bar_edit"]];
        CGRect imageFrame = imageView.frame;
        CGFloat x = (parentViewFrame.size.width - imageFrame.size.width) / 2;
        CGFloat y = parentViewFrame.size.height - imageFrame.size.height - 3.0f;
        imageView.frame = CGRectMake(x, y, imageFrame.size.width, imageFrame.size.height);
        [self.navigationItem.titleView addSubview:imageView];
        [imageView release];
        
        UIButton *button = [[UIButton alloc] initWithFrame:parentViewFrame];
        [button addTarget:self action:@selector(onClickTitle) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationItem.titleView addSubview:button];
        [button release];
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

- (void)onClickTitle
{
    NSLog(@"father-onClickTitle");
}

@synthesize leftNavButtonType = _leftNavButtonType;
@synthesize rightNavButtonType = _rightNavButtonType;
@synthesize clickable = _clickable;

@end

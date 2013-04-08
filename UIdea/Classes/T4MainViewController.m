//
//  T4MainViewController.m
//  UIdea
//
//  Created by Xiaohui on 13-4-8.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4MainViewController.h"
#import "T4ControllerMap.h"

#define NAVIGATION_BAR_BTN_RECT CGRectMake(0.0f, 0.0f, 36.0f, 28.0f)

@interface T4MainViewController ()

@end

@implementation T4MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    UIButton *hNavBtn = [[UIButton alloc] initWithFrame:NAVIGATION_BAR_BTN_RECT];
//    [hNavBtn setBackgroundImage:[UIImage imageNamed:@"nav_bar_button_normal"] forState:UIControlStateNormal];
//    [hNavBtn setBackgroundImage:[UIImage imageNamed:@"nav_bar_button_press"] forState:UIControlStateHighlighted];
//    UIBarButtonItem *hBtnItem = [[UIBarButtonItem alloc] initWithCustomView:hNavBtn];
//    self.navigationItem.leftBarButtonItem = hBtnItem;
//    self.navigationItem.title = @"11111111";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickTest:(id)sender
{
    [[T4ControllerMap sharedInstance] show:@"T4MainViewController"];
}

@end

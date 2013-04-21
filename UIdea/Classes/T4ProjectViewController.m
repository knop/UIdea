//
//  T4ProjectViewController.m
//  UIdea
//
//  Created by Xiaohui on 13-4-13.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4ProjectViewController.h"

@interface T4ProjectViewController ()

@end

@implementation T4ProjectViewController

- (void)viewDidLoad
{   
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.rightNavButtonType = NavButtonAdd;
    self.clickable = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onClickRightNavBarButton
{
    T4_LOG_P_FUNC;
}

- (void)onClickTitle
{
    T4_LOG_P_FUNC;
}

@end

//
//  T4MainViewController.m
//  UIdea
//
//  Created by Xiaohui on 13-4-8.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4MainViewController.h"
#import "T4ControllerMap.h"

@interface T4MainViewController ()

@end

@implementation T4MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.leftNavButtonType = NavButtonBack;
    self.rightNavButtonType = NavButtonAdd;
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

- (void)onClickRightNavBarButton
{
    NSLog(@"child-onClickRightNavBarButton");
}

@end

//
//  T4ProjectViewController.m
//  UIdea
//
//  Created by Xiaohui on 13-4-13.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4ProjectViewController.h"
#import "T4UIProject.h"

@interface T4ProjectViewController ()

@end

@implementation T4ProjectViewController

- (void)viewDidLoad
{   
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.rightNavButtonType = NavButtonAdd;
    self.titleClickable = YES;
    
    T4UIProject *project = [T4UIProject castFromObject:self.object];
    self.title = project.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onClickRightNavBarButton
{
    T4_LOG_P_FUNC;
    [T4Dialog showOptionsDialogWithDelegate:self];
}

- (void)onClickTitle
{
    T4_LOG_P_FUNC;
}

#pragma mark - T4OptionsDialogDelegate
- (void)onClickAlbum:(id)sender
{
    
}

- (void)onClickCamera:(id)sender
{
    
}

- (void)onClickWidget:(id)sender
{
    
}

@end

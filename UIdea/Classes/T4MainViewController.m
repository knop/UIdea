//
//  T4MainViewController.m
//  UIdea
//
//  Created by Xiaohui on 13-4-8.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4MainViewController.h"
#import "T4ControllerMap.h"
#import "T4UIProjectManager.h"

@interface T4MainViewController ()

- (IBAction)onClickNew:(id)sender;

@end

@implementation T4MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.leftNavButtonType = NavButtonNone;
    self.rightNavButtonType = NavButtonAdd;
    
    [self refreshView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onClickLeftNavBarButton
{
    NSLog(@"child-onClickRightNavBarButton");
}

- (void)onClickRightNavBarButton
{
    NSLog(@"child-onClickRightNavBarButton");
    [self newProject];
}

- (IBAction)onClickNew:(id)sender
{
    [self newProject];
}

- (void)refreshView
{
    if ([[T4UIProjectManager sharedInstance] projectCount] > 0) {
        self.dataView.hidden = NO;
        [self.dataTableView reloadData];
        self.emptyView.hidden = YES;
    } else {
        self.dataView.hidden = YES;
        self.emptyView.hidden = NO;
    }
}

- (void)newProject
{
    [[T4UIProjectManager sharedInstance] addProject];
    [self refreshView];
}

- (void)dealloc {
    [_emptyView release];
    [_dataTableView release];
    [_dataView release];
    [super dealloc];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end

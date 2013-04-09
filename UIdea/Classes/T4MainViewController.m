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
#import "T4ProjectCell.h"

@interface T4MainViewController ()

- (IBAction)onClickNew:(id)sender;

@end

@implementation T4MainViewController

- (id)init
{
    self = [super init];
    if (self) {
        _projectManager = [[T4UIProjectManager alloc] init];
    }
    return self;
}

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
    if (_projectManager.projects.count > 0) {
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
    [_projectManager addProject];
    [self refreshView];
}

- (void)dealloc {
    T4_RELEASE_SAFELY(_emptyView);
    T4_RELEASE_SAFELY(_dataTableView);
    T4_RELEASE_SAFELY(_dataView);
    [super dealloc];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _projectManager.projects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    T4ProjectCell *cell = [[T4ProjectCell alloc] init];
    id object = [_projectManager.projects objectAtIndex:indexPath.row];
    [cell setObject:object];
    return cell;
}

@end

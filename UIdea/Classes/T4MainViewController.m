//
//  T4MainViewController.m
//  UIdea
//
//  Created by Xiaohui on 13-4-8.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4MainViewController.h"
#import "T4ControllerManager.h"
#import "T4UIProjectManager.h"
#import "T4ProjectCell.h"
#import "T4UIProject.h"

#define defSectionHeight 18

@interface T4MainViewController ()

- (IBAction)onClickNew:(id)sender;
- (IBAction)onClickSearch:(id)sender;
- (void)initView;

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
    [self initView];
    [self refreshView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView
{
    self.leftNavButtonType = NavButtonNone;
    self.rightNavButtonType = NavButtonAdd;
    UIColor *bgColor = DefViewBGColor;
    self.emptyView.backgroundColor = bgColor;
    self.dataView.backgroundColor = bgColor;
    self.dataTableView.backgroundColor = bgColor;
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

- (IBAction)onClickSearch:(id)sender
{
    [[T4ControllerManager sharedInstance] showWithClassName:@"T4SearchViewController"
                                                  style:ShowStyleAdd
                                              animation:^(UIViewController *controller) {
                                                  CGFloat beginY = 77.0f;
                                                  CGFloat endY = 20.0f;
                                                  controller.view.alpha = 0.3f;
                                                  CGSize size = controller.view.frame.size;
                                                  controller.view.frame = CGRectMake(0,beginY,size.width,size.height);
                                                  [UIView beginAnimations:nil context:nil];
                                                  [UIView setAnimationDelegate:self];
                                                  [UIView setAnimationDuration:0.2];
                                                  [UIView setAnimationCurve:UIViewAnimationCurveLinear];
                                                  controller.view.alpha = 1.0f;
                                                  controller.view.frame = CGRectMake(0,endY,size.width,size.height);
                                                  [UIView commitAnimations];
                                              }];
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
    T4_RELEASE_SAFELY(_projectManager);
    [super dealloc];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[T4ControllerManager sharedInstance] showWithClassName:@"T4ProjectViewController"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return DefProjectCellHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    T4UIProject *project = [_projectManager.projects objectAtIndex:section];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, DefScreenWidth, defSectionHeight)];
    label.text = project.name;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = DefFontColor4;
    label.textColor = DefFontColor6;
    label.shadowColor = DefShadowColor1;
    label.shadowOffset = DefShadowOffset1;
    return label;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _projectManager.projects.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    T4UIProject *project = [_projectManager.projects objectAtIndex:section];
    return project.subProjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    T4UIProject *project = [_projectManager.projects objectAtIndex:indexPath.section];    
    T4TableViewCell *cell = [[[T4ProjectCell alloc] init] autorelease];
    id object = [project.subProjects objectAtIndex:indexPath.row];
    [cell setObject:object];
    return cell;
}

@end

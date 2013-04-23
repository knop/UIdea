//
//  T4SearchViewController.m
//  UIdea
//
//  Created by Xiaohui on 13-4-12.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4SearchViewController.h"
#import "T4SearchCell.h"

@interface T4SearchViewController ()

- (IBAction)onClickCancel:(id)sender;

@end

@implementation T4SearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataTableView.backgroundColor = DefViewBGColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickCancel:(id)sender
{
    CGFloat endY = 77.0f;
    CGSize size = self.view.frame.size;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDidStopSelector:@selector(disappearView)];
    self.view.alpha = 0.3f;
    self.view.frame = CGRectMake(0,endY,size.width,size.height);
    [UIView commitAnimations];
}

- (void)disappearView
{
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

- (void)dealloc {
    T4_RELEASE_SAFELY(_dataTableView);
    [super dealloc];
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return DefSearchCellHeight;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [T4TableViewCell tableView:tableView
                        cellWithClass:[T4SearchCell class]
                           withObject:nil];
}

@end

//
//  T4SearchViewController.m
//  UIdea
//
//  Created by Xiaohui on 13-4-12.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4SearchViewController.h"

@interface T4SearchViewController ()

- (IBAction)onClickCancel:(id)sender;

@end

@implementation T4SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
    [self.view removeFromSuperview];
}

- (void)dealloc {
    T4_RELEASE_SAFELY(_dataTableView);
    [super dealloc];
}
@end

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
    self.rightNavButtonType = NavButtonAdd;
    UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_icon"]];
    self.navigationItem.titleView = view;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onClickRightNavBarButton
{
    NSLog(@"child-onClickRightNavBarButton");
}

@end

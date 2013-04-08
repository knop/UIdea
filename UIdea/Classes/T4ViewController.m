//
//  T4ViewController.m
//  UIdea
//
//  Created by Xiaohui on 13-4-8.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4ViewController.h"

#define NAVIGATION_BAR_BTN_RECT CGRectMake(0.0f, 0.0f, 36.0f, 28.0f)

@implementation T4ViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.  
    //self addObserver:<#(NSObject *)#> forKeyPath:<#(NSString *)#> options:<#(NSKeyValueObservingOptions)#> context:<#(void *)#>
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIBarButtonItem *)createNavButtonWithType:(NavButtonType)type
{
    UIButton *hNavBtn = [[[UIButton alloc] initWithFrame:NAVIGATION_BAR_BTN_RECT] autorelease];
    [hNavBtn setBackgroundImage:[UIImage imageNamed:@"nav_bar_button_normal"] forState:UIControlStateNormal];
    [hNavBtn setBackgroundImage:[UIImage imageNamed:@"nav_bar_button_press"] forState:UIControlStateHighlighted];
    UIBarButtonItem *hBtnItem = [[[UIBarButtonItem alloc] initWithCustomView:hNavBtn] autorelease];

    return hBtnItem;
}

@end

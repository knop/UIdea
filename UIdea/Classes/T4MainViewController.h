//
//  T4MainViewController.h
//  UIdea
//
//  Created by Xiaohui on 13-4-8.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "T4ViewController.h"

@interface T4MainViewController : T4ViewController<UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) IBOutlet UIView *emptyView;
@property (retain, nonatomic) IBOutlet UITableView *dataTableView;
@property (retain, nonatomic) IBOutlet UIView *dataView;

@end

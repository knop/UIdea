//
//  T4MainViewController.h
//  UIdea
//
//  Created by Xiaohui on 13-4-8.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4ViewController.h"

@class T4UIProjectManager;

@interface T4MainViewController : T4ViewController<UITableViewDelegate, UITableViewDataSource>
{
    T4UIProjectManager *_projectManager;
}

@property (retain, nonatomic) IBOutlet UIView *emptyView;
@property (retain, nonatomic) IBOutlet UITableView *dataTableView;
@property (retain, nonatomic) IBOutlet UIView *dataView;

@end

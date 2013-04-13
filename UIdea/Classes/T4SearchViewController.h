//
//  T4SearchViewController.h
//  UIdea
//
//  Created by Xiaohui on 13-4-12.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface T4SearchViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *dataTableView;

@end

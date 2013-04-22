//
//  T4TableViewCell.h
//  UIdea
//
//  Created by Xiaohui on 13-4-9.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface T4TableViewCell : UITableViewCell

- (void)setObject:(id)object;

+ (T4TableViewCell *)tableView:(UITableView *)tableView
                 cellWithClass:(Class)c
                    withObject:(id)object;

@end

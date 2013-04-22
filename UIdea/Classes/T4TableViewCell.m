//
//  T4TableViewCell.m
//  UIdea
//
//  Created by Xiaohui on 13-4-9.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4TableViewCell.h"

@implementation T4TableViewCell

- (void)setObject:(id)object
{
    
}

+ (T4TableViewCell *)tableView:(UITableView *)tableView
                 cellWithClass:(Class)c
                    withObject:(id)object
{
    NSString *identifier = NSStringFromClass(c);
    T4TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[c alloc] initWithStyle:UITableViewCellStyleDefault
                         reuseIdentifier:identifier] autorelease];
    }
    
    [cell setObject:object];
    
    return cell;
}

@end

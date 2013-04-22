//
//  T4SearchCell.m
//  UIdea
//
//  Created by Xiaohui on 13-4-13.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4SearchCell.h"

@implementation T4SearchCell

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.textLabel.TextColor = DefFontColor2;
        self.textLabel.highlightedTextColor = DefFontColor2;
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    if (selected) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = DefSearchCellColor;
        self.selectedBackgroundView = view;
        [view release];
    } else {
        self.selectedBackgroundView = nil;
    }
}

- (void)setObject:(id)object
{
    self.textLabel.text = @"hello";
    self.imageView.image = [UIImage imageNamed:@"search_icon"];
}

@end

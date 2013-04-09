//
//  T4ProjectCell.m
//  UIdea
//
//  Created by Xiaohui on 13-4-9.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4ProjectCell.h"
#import "T4UIProject.h"

@implementation T4ProjectCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setObject:(id)object
{
    T4UIProject *project = [object retain];
    
    self.textLabel.text = project.name;
    self.detailTextLabel.text = project.description;
    NSString *imageName = project.viewCount > 0 ? @"main_project_cell_full" : @"main_project_cell_empty";
    self.imageView.image = [UIImage imageNamed:imageName];
    
    [project release];
}


- (void)dealloc
{
    [super dealloc];
}

@end

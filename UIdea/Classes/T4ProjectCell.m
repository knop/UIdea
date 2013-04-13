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
        self.textLabel.TextColor = DefFontColor1;
        self.textLabel.highlightedTextColor = DefFontColor1;
        self.detailTextLabel.TextColor = DefFontColor2;
        self.detailTextLabel.highlightedTextColor = DefFontColor2;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if (selected) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_project_cell_selected"]];
        self.selectedBackgroundView = imageView;
        [imageView release];
    } else {
        self.selectedBackgroundView = nil;
    }
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

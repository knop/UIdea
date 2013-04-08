//
//  T4ViewController.h
//  UIdea
//
//  Created by Xiaohui on 13-4-8.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    NavButtonBack,
    NavButtonAdd,
} NavButtonType;

@interface T4ViewController : UIViewController
{
    NavButtonType _navButtonType;
}

@property (nonatomic) NavButtonType leftNavButtonType;
@property (nonatomic) NavButtonType rightNavButtonType;

@end

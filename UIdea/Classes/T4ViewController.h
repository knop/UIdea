//
//  T4ViewController.h
//  UIdea
//
//  Created by Xiaohui on 13-4-8.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

typedef enum {
    NavButtonNone,
    NavButtonBack,
    NavButtonAdd,
    NavButtonSetting,
} NavButtonType;

@interface T4ViewController : UIViewController

@property (nonatomic) NavButtonType leftNavButtonType;
@property (nonatomic) NavButtonType rightNavButtonType;

@end

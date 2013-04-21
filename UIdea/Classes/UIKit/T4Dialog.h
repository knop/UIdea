//
//  T4Dialog.h
//  UIdea
//
//  Created by Xiaohui on 13-4-16.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    T4DialogTypeEdit   = 1,
    T4DialogTypeOptions   = 2,
} T4DialogType;

@interface T4Dialog : UIView<UIGestureRecognizerDelegate>
{
    UIView *_contentView;
    UIView *_coverView;
    CGPoint _center;
}

@property (nonatomic) BOOL enableTapRecognizer;

@end

@interface T4Dialog(StaticMethod)

+ (void)showEditDialog;
+ (void)showOptionsDialog;

@end
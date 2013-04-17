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

typedef enum {
    T4DialogResultTypePositive = 1,
    T4DialogResultTypeNegative = 2,
    T4DialogResultTypeCancel = 3,
} T4DialogResultType;

typedef void (^DialogBlock)(T4DialogResultType result);

@interface T4DialogBuilder : NSObject

@property (nonatomic, copy) DialogBlock resultBlock;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic) T4DialogType dialogType;

@end

@interface T4Dialog : UIView
{
    T4DialogBuilder *_builder;
    CGPoint _center;
}

- (id)initWithBuilder:(T4DialogBuilder *)newBuilder;

+ (void)showEditDialog;
+ (void)showOptionsDialog;

@end

@interface T4DialogBuilder(method)

- (T4Dialog *)create;

@end
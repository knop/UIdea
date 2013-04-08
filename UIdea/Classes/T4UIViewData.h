//
//  T4UIViewData.h
//  UIdea
//
//  Created by Xiaohui on 13-4-8.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 控件数据类，存储控件的相关参数，然后通过控件工厂T4UIFactory生成相应的控件
 */

typedef enum {
    T4View,
    T4Button,
} ViewType;

@interface T4UIViewData : NSObject

@property (nonatomic) ViewType viewType;
@property (nonatomic) NSInteger x;
@property (nonatomic) NSInteger y;
@property (nonatomic) NSInteger width;
@property (nonatomic) NSInteger height;

@property (nonatomic, retain) NSArray *child;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *backgroundImage;
@property (nonatomic, copy) NSString *backgroundColor;
@property (nonatomic, copy) NSString *description;

- (void)addSubViewData;
- (void)removeSubViewData;

@end

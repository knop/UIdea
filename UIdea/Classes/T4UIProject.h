//
//  T4UIProject.h
//  UIdea
//
//  Created by Xiaohui on 13-4-9.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

@interface T4UIProject : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, retain, readonly) NSMutableArray *subProjects;
@property (nonatomic) NSUInteger viewCount;
@property (nonatomic) long createTime;
@property (nonatomic) long updateTime;

- (void)addSubProjects;

@end

//
//  T4UIFactory.h
//  UIdea
//
//  Created by Xiaohui on 13-4-8.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "T4UIView.h"

@interface T4UIFactory : NSObject

- (UIView *)genNativeView:(T4UIView *)t4View;

@end

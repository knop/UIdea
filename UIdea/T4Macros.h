//
//  T4Macro.h
//  UIdea
//
//  Created by Xiaohui on 13-4-9.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "SynthesizeSingleton.h"

#define T4_RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }
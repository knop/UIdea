//
//  T4Macro.h
//  UIdea
//
//  Created by Xiaohui on 13-4-9.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "SynthesizeSingleton.h"

//__func__, __PRETTY_FUNCTION__, __LINE__, __FILE__, _cmd

#ifdef DEBUG
    #  define T4_LOG(fmt, ...) \
    do { \
        NSLog((@"%@(%d) " fmt), \
            [[NSString stringWithUTF8String:__FILE__] lastPathComponent], \
            __LINE__, \
            ##__VA_ARGS__); \
    } while(0)

    #  define T4_LOG_FUNC NSLog(@"%s", __func__)
    #  define T4_LOG_P_FUNC NSLog(@"%s", __PRETTY_FUNCTION__)
    #  define T4_RETAIN_COUNT(__p) NSLog(@"%s(%d): count = %d\n", __func__, __LINE__, [__p retainCount])
#else
    #  define T4_LOG(...)
    #  define T4_LOG_FUNC
    #  define T4_LOG_P_FUNC
    #  define T4_RETAIN_COUNT(p)
#endif

#define T4_RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }

#pragma mark - Color Define

#define DefFontColor1 [UIColor colorWithRed:25.0f/255.0f green:25.0f/255.0f blue:25.0f/255.0f alpha:1.0f]
#define DefFontColor2 [UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f]
#define DefFontColor3 [UIColor colorWithRed:160.0f/255.0f green:160.0f/255.0f blue:160.0f/255.0f alpha:1.0f]
#define DefFontColor4 [UIColor colorWithRed:170.0f/255.0f green:170.0f/255.0f blue:170.0f/255.0f alpha:1.0f]
#define DefFontColor5 [UIColor colorWithRed:210.0f/255.0f green:83.0f/255.0f blue:83.0f/255.0f alpha:1.0f]
#define DefFontColor6 [UIColor whiteColor]

#define DefViewBGColor [UIColor colorWithRed:230.0f/255.0f green:230.0f/255.0f blue:230.0f/255.0f alpha:1.0f]
#define DefSearchCellColor [UIColor colorWithRed:210.0f/255.0f green:217.0f/255.0f blue:224.0f/255.0f alpha:1.0f]
#define DefTitleColor [UIColor colorWithRed:210.0f/255.0f green:217.0f/255.0f blue:224.0f/255.0f alpha:1.0f]

#define DefShadowColor1 [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f]
#define DefShadowColor2 [UIColor colorWithRed:56.0f/255.0f green:103.0f/255.0f blue:146.0f/255.0f alpha:0.75f]

//Dialog标题阴影
#define DefShadowColor3 [UIColor colorWithRed:27.0f/255.0f green:38.0f/255.0f blue:48.0f/255.0f alpha:0.75f]

#pragma mark - Shadow offset

#define DefShadowOffset1 CGSizeMake(0, -1)

#pragma mark - Font Size

#define DefFont40 [UIFont boldSystemFontOfSize:20]
#define DefFont30 [UIFont boldSystemFontOfSize:15]
#define DefFont28 [UIFont boldSystemFontOfSize:14]
#define DefFont26 [UIFont boldSystemFontOfSize:13]

#pragma mark - cell height

#define DefProjectCellHeight 70.0f
#define DefSearchCellHeight 45.0f
//
//  T4Macro.h
//  UIdea
//
//  Created by Xiaohui on 13-4-9.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "SynthesizeSingleton.h"

#define T4_RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }

#define DefScreenWidth 320.0f

#pragma mark - Color Define

#define DefFontColor1 [UIColor colorWithRed:25.0f/255.0f green:25.0f/255.0f blue:25.0f/255.0f alpha:1.0f]
#define DefFontColor2 [UIColor colorWithRed:70.0f/255.0f green:70.0f/255.0f blue:70.0f/255.0f alpha:1.0f]
#define DefFontColor3 [UIColor colorWithRed:160.0f/255.0f green:160.0f/255.0f blue:160.0f/255.0f alpha:1.0f]
#define DefFontColor4 [UIColor colorWithRed:170.0f/255.0f green:170.0f/255.0f blue:170.0f/255.0f alpha:1.0f]
#define DefFontColor5 [UIColor colorWithRed:210.0f/255.0f green:83.0f/255.0f blue:83.0f/255.0f alpha:1.0f]
#define DefFontColor6 [UIColor whiteColor]

#define DefViewBGColor [UIColor colorWithRed:230.0f/255.0f green:230.0f/255.0f blue:230.0f/255.0f alpha:1.0f]
#define DefSearchCellColor [UIColor colorWithRed:170.0f/255.0f green:170.0f/255.0f blue:170.0f/255.0f alpha:1.0f]

#define DefShadowColor1 [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f]

#pragma mark - Shadow offset

#define DefShadowOffset1 CGSizeMake(0, -1)

#pragma mark - Font Size

#define DefFontSize1 40
#define DefFontSize2 30
#define DefFontSize3 28
#define DefFontSize4 26

#pragma mark - cell height

#define DefProjectCellHeight 70.0f
#define DefSearchCellHeight 45.0f
//
//  T4Toast.h
//  UIdea
//
//  Created by xiaohui on 12-10-18.
//
//

#import <UIKit/UIKit.h>

typedef enum {
    T4ToastTypeBottom = 1,
    T4ToastTypeMiddle = 2,
} T4ToastType;

@interface T4Toast : UIView
{
    UIButton *_contentView;
}

- (id)initWithText:(NSString*)texts;

+ (void)showWithText:(NSString*)text;

@end


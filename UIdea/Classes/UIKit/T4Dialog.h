//
//  T4Dialog.h
//  iphone
//
//  Created by xiaohui on 12-10-18.
//
//

#import <UIKit/UIKit.h>
#import "TvButton.h"

typedef enum {
    TvDialogTypeWithTwoButton   = 1,
    TvDialogTypeWithOneButton   = 2,
    TvDialogTypeWaiting   = 3,
} TvDialogType;

typedef enum {
    TvToastTypeBottom = 1,
    TvToastTypeMiddle = 2,
} TvToastType;

typedef enum {
    TvDialogResultTypePositive = 1,
    TvDialogResultTypeNegative = 2,
    TvDialogResultTypeCancel = 3,
} TvDialogResultType;

typedef void (^DialogBlock)(TvDialogResultType result);

@class TvDialogBuilder;

@interface T4Dialog : UIView
{
    TvDialogBuilder * builder;
    UIView *coverView;
    CGFloat angle;
    
    UIView* animationView;
    
    BOOL displaying;
}

- (id)initWithFrame:(CGRect)frame builder:(TvDialogBuilder *)newBuilder;
- (TvDialog *)show;
- (void)dismiss;


+ (TvDialog *)showDialogWithText:(NSString *)text;
+ (TvDialog *)showDialogWithText:(NSString *)text ButtonText:(NSString*)btnText;
+ (TvDialog *)showDialogWithText:(NSString *)text resultBlock:(DialogBlock)block;
+ (TvDialog *)showDialogWithText:(NSString *)text
                            type:(TvDialogType)type
                     resultBlock:(DialogBlock)block;
+ (TvDialog *)showDialogWithText:(NSString *)text
                            type:(TvDialogType)type
                          parent:(UIView *)parent
                     resultBlock:(DialogBlock)block;

+ (TvDialog *)showWaitingDialog;
+ (TvDialog *)showWaitingDialogWithBlock:(DialogBlock)block;
+ (TvDialog *)showWaitingDialog:(NSString *)text;
+ (TvDialog *)showWaitingDialog:(NSString *)text resultBlock:(DialogBlock)block;

+ (TvDialog *)showDialogWithCancel:(NSString *)text;
+ (TvDialog *)showDialogWithCancel:(NSString *)text resultBlock:(DialogBlock)block;

+ (void)showToast:(NSString*)text;
+ (void)showToast:(NSString*)text type:(TvToastType)type;

// global toast, need to be removed manually.
+ (void)showGlobalToast:(NSString*)text;
+ (void)hideGlobalToast;

@end

@interface TvDialogBuilder : NSObject

@property (nonatomic, retain) UIImage *image;
@property (nonatomic, copy) DialogBlock resultBlock;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic) NSUInteger numberOfMessages;
@property (nonatomic, copy) NSString *positiveButtonText;
@property (nonatomic, copy) NSString *negativeButtonText;
@property (nonatomic) TvButtonType positiveButtonType;
@property (nonatomic) TvButtonType negativeButtonType;
@property (nonatomic) TvDialogType dialogType;
@property (nonatomic) BOOL hasCancelButton;
@property (nonatomic) BOOL positiveButtonEnable;
@property (nonatomic) BOOL negativeButtonEnable;

- (TvDialog *)create;
@end

@interface TvToast : UIView
- (id) initWithTitle:(NSString*)title type:(TvToastType)type;

- (void)showToast;
- (void)hideToast;
@end


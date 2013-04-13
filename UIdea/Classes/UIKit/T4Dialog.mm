//
//  T4Dialog.m
//  iphone
//
//  Created by xiaohui on 12-10-18.
//
//

#import "T4Dialog.h"
#import "TvButton.h"
#import "TxUtil.h"

#define LENGTH_OF_ONE_MESSAGE 17

@implementation TvDialogBuilder

@synthesize title;
@synthesize message;
@synthesize positiveButtonText;
@synthesize negativeButtonText;
@synthesize positiveButtonType;
@synthesize negativeButtonType;
@synthesize dialogType;
@synthesize image;
@synthesize resultBlock;
@synthesize hasCancelButton;
@synthesize positiveButtonEnable;
@synthesize negativeButtonEnable;
@synthesize numberOfMessages;

- (id)init
{
    self = [super init];
    if (self != nil) {
        self.numberOfMessages = 1;
        self.positiveButtonType = TvButtonTypeMiddleGreen;
        self.negativeButtonType = TvButtonTypeMiddleWhite;
        self.positiveButtonText = NSLocalizedString(@"button_positive", nil);
        self.negativeButtonText = NSLocalizedString(@"button_negative", nil);
        self.hasCancelButton = NO;
        self.positiveButtonEnable = YES;
        self.negativeButtonEnable = YES;
    }
    return self;
}

- (TvDialog *)create
{
    return [[[TvDialog alloc] initWithFrame:[[UIScreen mainScreen] bounds] builder:self] autorelease];
}

- (void)dealloc
{
    self.title = nil;
    self.message = nil;
    self.positiveButtonText = nil;
    self.negativeButtonText  = nil;
    self.image = nil;
    self.resultBlock = nil;
    [super dealloc];
}

@end


@interface T4Dialog ()

- (void)initView;
- (void)onClickPositive;
- (void)onClickNegative;
- (void)onClickCancel;
- (CGRect)imageCenterRect:(UIImage *)image;
//- (UIColor *)textColor:(enum TvButtonType)type;

- (void) startAnimation:(UIView*) view;
- (void) stopAnimation;

@end

@implementation T4Dialog

- (id)initWithFrame:(CGRect)frame builder:(TvDialogBuilder *)newBuilder
{
    self = [super initWithFrame:frame];
    if (self) {
        builder = [newBuilder retain];
        [self initView];
        [self changeStatusBarOrientation];
    }
    return self;
}

- (void)initButtonView:(CGRect)rect
{
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0];
    if (builder.dialogType == TvDialogTypeWithOneButton || builder.dialogType == TvDialogTypeWaiting) {
        CGFloat x = rect.origin.x + 60.0f;
        CGFloat height = 38.0f;
        CGFloat y = rect.origin.y + rect.size.height - 24.0f - height;
        CGFloat width = rect.size.width - 120.0f;
        TvButton *button = [[TvButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
        if (builder.dialogType == TvDialogTypeWithOneButton) {
            button.titleLabel.text = builder.positiveButtonText;
            button.titleLabel.font = font;
            [button setTitle:builder.positiveButtonText forState:UIControlStateNormal];
            [button setTitle:builder.positiveButtonText forState:UIControlStateHighlighted];
            [button setTitle:builder.positiveButtonText forState:UIControlStateSelected];
            button.type = TvButtonTypeMiddleWhite;
            button.enabled = builder.positiveButtonEnable;
            //            button.titleLabel.textColor = [self textColor:TvButtonTypeWhite];
            [button addTarget:self action:@selector(onClickPositive) forControlEvents:UIControlEventTouchUpInside];
        } else {
            button.titleLabel.text = builder.negativeButtonText;
            button.titleLabel.font = font;
            [button setTitle:builder.negativeButtonText forState:UIControlStateNormal];
            [button setTitle:builder.negativeButtonText forState:UIControlStateHighlighted];
            [button setTitle:builder.negativeButtonText forState:UIControlStateSelected];
            button.type = builder.negativeButtonType;
            button.enabled = builder.negativeButtonEnable;
            //            button.titleLabel.textColor = [self textColor:builder.negativeButtonType];
            [button addTarget:self action:@selector(onClickNegative) forControlEvents:UIControlEventTouchUpInside];
        }
        [self addSubview:button];
        [button release];
    } else if (builder.dialogType == TvDialogTypeWithTwoButton) {
        CGFloat x = rect.origin.x + 20.0f;
        CGFloat height = 38.0f;
        CGFloat y = rect.origin.y + rect.size.height - 24.0f - height;
        CGFloat width = 117.5f;
        TvButton *oneButton = [[TvButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
        oneButton.titleLabel.font = font;
        oneButton.titleLabel.text = builder.negativeButtonText;
        [oneButton setTitle:builder.negativeButtonText forState:UIControlStateNormal];
        [oneButton setTitle:builder.negativeButtonText forState:UIControlStateHighlighted];
        [oneButton setTitle:builder.negativeButtonText forState:UIControlStateSelected];
        oneButton.type = builder.negativeButtonType;
        oneButton.enabled = builder.negativeButtonEnable;
        //  oneButton.titleLabel.textColor = [self textColor:builder.negativeButtonType];
        [oneButton addTarget:self action:@selector(onClickNegative) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:oneButton];
        [oneButton release];
        
        x = x + width + 10.0f;
        TvButton *twoButton = [[TvButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
        twoButton.titleLabel.text = builder.positiveButtonText;
        twoButton.titleLabel.font = font;
        [twoButton setTitle:builder.positiveButtonText forState:UIControlStateNormal];
        [twoButton setTitle:builder.positiveButtonText forState:UIControlStateHighlighted];
        [twoButton setTitle:builder.positiveButtonText forState:UIControlStateSelected];
        twoButton.type = builder.positiveButtonType;
        twoButton.enabled = builder.positiveButtonEnable;
        //  twoButton.titleLabel.textColor = [self textColor:builder.negativeButtonType];
        [twoButton addTarget:self action:@selector(onClickPositive) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:twoButton];
        [twoButton release];
    }
    
    if (builder.hasCancelButton) {
        CGFloat width = 40.0f;
        CGFloat height = 40.0f;
        CGFloat x = rect.origin.x + rect.size.width - width + 10.0f;
        CGFloat y = rect.origin.y - 10.0f;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(x, y, width, height);
        button.titleLabel.text = builder.negativeButtonText;
        [button addTarget:self action:@selector(onClickCancel) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(2.0f, 20.0f, 15.5f, 15.5f)];
        imageView.image = [UIImage imageNamed:@"dialog_cancel"];
        [button addSubview:imageView];
        [imageView release];
    }
}

- (void)initView
{
    displaying = YES;
    UIImage *image = [UIImage imageNamed:@"dialog_bg"];
    CGSize size = CGSizeMake(CGImageGetWidth(image.CGImage)/2.0f, CGImageGetHeight(image.CGImage)/2.0f);
    CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (systemVersion >= 6.0) {
        UIEdgeInsets capInsets = UIEdgeInsetsMake(20, 0, size.height - 18, 573);
        image = [image resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch];
    } else {
        image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:20];
    }

    CGRect rect = [self imageCenterRect:image];
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:rect];
    bgImageView.image = image;
    [self addSubview:bgImageView];
    [bgImageView release];   
    
    if (builder.dialogType == TvDialogTypeWaiting) {
        builder.image = [UIImage imageNamed:@"dialog_waiting_big"];
    }

    BOOL hasImage = (builder.image != nil);
    BOOL hasTitle = (builder.title.length > 0);
    BOOL hasMessage = (builder.message.length > 0);
    if (hasTitle && !hasMessage && !hasImage) {
        hasTitle = NO;
        hasMessage = YES;
        builder.message = builder.title;
        builder.title = @"";
    }
    
    if (hasTitle) {
        CGFloat x = rect.origin.x + 15.0f;
        CGFloat y = rect.origin.y + 26.0f;
        CGFloat width = rect.size.width - 30.0f;
        CGFloat height = 20.0f;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
        label.backgroundColor = [UIColor clearColor];
        label.text = builder.title;
        label.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0];//[UIFont systemFontOfSize:16.0f];
        label.textAlignment = UITextAlignmentCenter;
        [self addSubview:label];
        [label release];
    }
    
    if (hasImage) {
        CGSize imageSize = CGSizeMake(CGImageGetWidth(builder.image.CGImage)/2.0f, CGImageGetHeight(builder.image.CGImage)/2.0f);
        CGFloat x = (rect.size.width - imageSize.width)/2.0f;
        CGFloat y = hasTitle ? 52.0f : 30.0f;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, imageSize.width, imageSize.height)];
        imageView.image = builder.image;
        if (builder.dialogType == TvDialogTypeWaiting) {
            [self startAnimation:imageView];
        }
        [bgImageView addSubview:imageView];
        [imageView release];
    } else if (hasMessage) {
        CGFloat x = rect.origin.x + 26.0f;
        CGFloat offsetY = hasTitle ? 40.0f : 13.0f;
        CGFloat y = rect.origin.y + offsetY;
        CGFloat width = rect.size.width - 52.0f;
        CGFloat height = rect.size.height - 65.0f - offsetY;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
        label.numberOfLines = builder.numberOfMessages + 3;
        label.backgroundColor = [UIColor clearColor];
        label.text = builder.message;

        label.textAlignment = UITextAlignmentLeft;
        if (hasTitle) {
            label.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.0];
            label.textColor = [UIColor colorWithRed:130.0/255.0 green:130.0/255.0 blue:130.0/255.0 alpha:1.0];
            if (label.text.length > LENGTH_OF_ONE_MESSAGE) {
                label.textAlignment = UITextAlignmentLeft;
            } else {
                label.textAlignment = UITextAlignmentCenter;
            }            
        } else {
            label.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0];
            label.textAlignment = UITextAlignmentCenter;
        }
        
        [self addSubview:label];
        [label release];
        hasMessage = YES;
    }
    
    [self initButtonView:rect];
}

- (void)animationStopped
{
    if(displaying)
    {
        [self startAnimation:animationView];
    }
}

- (void) startAnimation:(UIView*) view
{
    animationView = view;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationStopped)];
    [UIView setAnimationDelay:0];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];

    CGAffineTransform tr = CGAffineTransformMakeRotation(angle);
    view.transform = tr;
    angle -= M_PI_2 ;
    
    [UIView commitAnimations];
}

- (void) stopAnimation
{
    displaying = NO;
    [UIView setAnimationDelegate:nil];
}

- (TvDialog *)show
{
    UIView* view = [[UIApplication sharedApplication] keyWindow].rootViewController.view;
    [view endEditing:YES];
    CGFloat max = MAX([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    CGRect coverRect = CGRectMake(0, 0, max, max);
    coverView = [[[UIView alloc] initWithFrame:coverRect] autorelease];
    coverView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    [view addSubview:coverView];
    [view addSubview:self];
    displaying = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeStatusBarOrientation)
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification
                                               object:nil];
    return self;
}

- (void)changeStatusBarOrientation
{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    NSLog(@"orientation:%d", orientation);
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown) {
        CGFloat x = (screenRect.size.width - self.frame.size.width)/2.0f;
        CGFloat y = 20.0f + (screenRect.size.height - 20.0f - self.frame.size.height)/2.0f;
        self.frame = CGRectMake(x, y, self.frame.size.width, self.frame.size.height);
    } else {
        CGFloat x = (screenRect.size.height - self.frame.size.width)/2.0f;
        CGFloat y = 20.0f + (screenRect.size.width - 20.0f - self.frame.size.height)/2.0f;
        self.frame = CGRectMake(x, y, self.frame.size.width, self.frame.size.height);
    }
}

+ (TvDialog *)showDialogWithText:(NSString *)text
{
    return [TvDialog showDialogWithText:text resultBlock:nil];
}

+ (TvDialog *)showDialogWithText:(NSString *)text resultBlock:(DialogBlock)block
{
    return [TvDialog showDialogWithText:text type:TvDialogTypeWithOneButton resultBlock:block];
}

+ (TvDialog *)showDialogWithText:(NSString *)text
                            type:(TvDialogType)type
                     resultBlock:(DialogBlock)block
{
    UIView* view = [[UIApplication sharedApplication] keyWindow].rootViewController.view;
    return [TvDialog showDialogWithText:text type:type parent:view resultBlock:block];
}

+ (TvDialog *)showDialogWithText:(NSString *)text
                            type:(TvDialogType)type
                          parent:(UIView *)parent
                     resultBlock:(DialogBlock)block
{  
    TvDialogBuilder *builder = [[[TvDialogBuilder alloc] init] autorelease];
    builder.title = text;
    builder.dialogType = type;
    builder.resultBlock = block;
    return [[builder create] show];
}

+ (TvDialog *)showDialogWithText:(NSString *)text ButtonText:(NSString*)btnText
{
    TvDialogBuilder *builder = [[[TvDialogBuilder alloc] init] autorelease];
    builder.title = text;
    builder.dialogType = TvDialogTypeWithOneButton;
    builder.positiveButtonText = btnText;
    builder.negativeButtonText = btnText;
    return [[builder create] show];
}

+ (TvDialog *)showWaitingDialog
{
    return [TvDialog showWaitingDialog:nil];
}

+ (TvDialog *)showWaitingDialogWithBlock:(DialogBlock)block
{
    return [TvDialog showWaitingDialog:nil resultBlock:block];
}

+ (TvDialog *)showWaitingDialog:(NSString *)text
{
    return [TvDialog showWaitingDialog:text resultBlock:nil];
}

+ (TvDialog *)showWaitingDialog:(NSString *)text resultBlock:(DialogBlock)block
{
    return [TvDialog showDialogWithText:text type:TvDialogTypeWaiting resultBlock:block];
}

+ (TvDialog *)showDialogWithCancel:(NSString *)text
{
    return [TvDialog showDialogWithCancel:text resultBlock:nil];
}

+ (TvDialog *)showDialogWithCancel:(NSString *)text resultBlock:(DialogBlock)block
{
    TvDialogBuilder *builder = [[[TvDialogBuilder alloc] init] autorelease];
    builder.title = text;
    builder.dialogType = TvDialogTypeWithTwoButton;
    builder.resultBlock = block;
    builder.hasCancelButton = YES;
    return [[builder create] show];
}

+ (void)showToast:(NSString*)text
{
    [TvDialog showToast:text type:TvToastTypeBottom];
}

+ (void)showToast:(NSString*)text type:(TvToastType)type
{
    TvToast* toast = [[[TvToast alloc] initWithTitle:text type:type] autorelease];
    
    [NSTimer scheduledTimerWithTimeInterval:0.0 target:toast selector:@selector(showToast) userInfo:nil repeats:NO];
}

static TvToast* globalToast = nil;

+ (void)showGlobalToast:(NSString*)text
{
    if(globalToast)
    {
        [globalToast removeFromSuperview];
        [globalToast release];
        globalToast = nil;
    }
    
    if(!globalToast)
    {
        globalToast = [[TvToast alloc] initWithTitle:text type:TvToastTypeBottom];
        [globalToast removeFromSuperview];
    }

    globalToast.alpha = 1.0;
    globalToast.hidden = NO;
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:globalToast];
}

+ (void) removeGlobalToast
{
    if(globalToast)
    {
        [globalToast removeFromSuperview];
        [globalToast release];
        globalToast = nil;
    }
 
}

+ (void)hideGlobalToast
{
    if(globalToast)
    {
        globalToast.alpha = 1.0;
        [UIView animateWithDuration:1.0f animations:^{
            globalToast.alpha = 0.0;
        } completion:^(BOOL finished) {
            if(finished)
            {
                [TvDialog removeGlobalToast];
            }
        }];
    }
}

- (void)dismiss
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIApplicationDidChangeStatusBarOrientationNotification
                                                  object:nil];
    builder.resultBlock = nil;
    [builder release];
    builder = nil;
    
    [self stopAnimation];
    [coverView removeFromSuperview];
    coverView = nil;
    [self removeFromSuperview];

}

- (CGRect)imageCenterRect:(UIImage *)image
{
    CGSize size = CGSizeMake(CGImageGetWidth(image.CGImage)/2.0f, CGImageGetHeight(image.CGImage)/2.0f);
    CGFloat x = 0.0f;
    CGFloat y = 0.0f;
    CGFloat width = size.width;
    NSInteger diff = builder.numberOfMessages - 3;
    CGFloat height = size.height;
    if (diff > 0) {
        height += diff * 20;
    }
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    x = (screenRect.size.width - width)/2.0f;
    y = 20.0f + (screenRect.size.height - 20.0f - height)/2.0f;

    return CGRectMake(x, y, width, height);
}

- (void)onClickPositive
{
    if (builder.resultBlock) {
        builder.resultBlock(TvDialogResultTypePositive);
    }
    [self dismiss];
}

- (void)onClickNegative
{
    if (builder.resultBlock) {
        builder.resultBlock(TvDialogResultTypeNegative);
    }
    [self dismiss];
}

- (void)onClickCancel
{
    if (builder.resultBlock) {
        builder.resultBlock(TvDialogResultTypeCancel);
    }
    [self dismiss];
}

- (void)dealloc {
    NSLog(@"dealloc");
    //[coverView release];
    [builder release];
    [super dealloc];
}
@end

@interface TvToast (TvToastPrivate)

- (UIImage *)imageWithRect:(CGSize)size;

@end

@implementation TvToast

- (id) initWithTitle:(NSString*)title type:(TvToastType)type
{
    if(self = [super init]) {
        UIView* view = [[UIApplication sharedApplication] keyWindow].rootViewController.view;
        [view addSubview:self];
        self.alpha = 0.0;
        
        UIImage *leftImage = [UIImage imageNamed:@"toast_bg_left"];
        UIImage *midImage = [UIImage imageNamed:@"toast_bg_mid"];
        UIImage *rightImage = [UIImage imageNamed:@"toast_bg_right"];

        
        CGRect screenRect = view.frame;
        CGSize size = CGSizeMake(175.0f, CGImageGetHeight(leftImage.CGImage)/2.0f);
        CGFloat y = screenRect.size.height - size.height - 5.0f;
        if (type == TvToastTypeMiddle) {
            y = (screenRect.size.height - size.height) / 2.0f;
        }
        CGRect rect = CGRectMake((screenRect.size.width - size.width)/2.0f, y, size.width, size.height);
        
        
        ///background
        UIImage *image = [TxUtil spliceImage:size
                                   leftImage:leftImage
                                    midImage:midImage
                                  rightImage:rightImage];
        UIImageView *bgImageView = [[[UIImageView alloc] initWithFrame:rect] autorelease];
        bgImageView.image = image;
        [self addSubview:bgImageView];
        
        UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0];
        ///Title
        if (title != nil && title.length > 0) {
            if (title.length > 13) {
                title = [title substringToIndex:13];
                title = [title stringByAppendingString:@"..."];
            }
            CGSize titleSize = [title sizeWithFont:font];
            CGFloat x = rect.origin.x;
            CGFloat y = rect.origin.y + (size.height - titleSize.height) / 2.0f;
            CGFloat width = size.width;
            CGFloat height = titleSize.height;
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
            label.backgroundColor = [UIColor clearColor];
            label.text = title;
            label.numberOfLines = 1;
            label.font = font;
            label.textAlignment = UITextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
//            label.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
            [self addSubview:label];
            [label release];
        }
    }
    
    return self;
}

- (void)showToastAnimationStopped
{
    [self performSelector:@selector(hideToast) withObject:self afterDelay:2.0];
}

- (void)showToast
{
//    self.hidden = NO;
//    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        self.alpha = 1.0;
//    } completion:^(BOOL finished) {
//        [self performSelector:@selector(hideToast) withObject:self afterDelay:0.0];
//    }];    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(showToastAnimationStopped)];
    [UIView setAnimationDelay:0];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    self.alpha = 1.0f;
    self.hidden = NO;
    [UIView commitAnimations];
}

- (void)hideToastAnimationStopped
{
    self.hidden = YES;    
}

- (void)hideToast
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(hideToastAnimationStopped)];
    [UIView setAnimationDelay:0];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    self.alpha = 0.0f;
    [UIView commitAnimations];
//    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        self.alpha = 0.0f;
//    } completion:^(BOOL finished) {
//        self.hidden = YES;
//        
//    }];
}

- (void)dealloc
{
    [super dealloc];
}

@end

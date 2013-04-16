//
//  T4Toast.m
//  UIdea
//
//  Created by xiaohui on 12-10-18.
//
//

#import "T4Toast.h"
#import <QuartzCore/QuartzCore.h>

#define defDelaySecond 3

@implementation T4Toast

- (id)initWithText:(NSString*)text
{
    self = [super init];
    if (self) {
        UIFont *font = DefFont28;
        CGSize textSize = [text sizeWithFont:font
                           constrainedToSize:CGSizeMake(280, MAXFLOAT)
                               lineBreakMode:NSLineBreakByWordWrapping];
        CGFloat offset = 12.0f;
        CGRect rect = CGRectMake(0.0f, 0.0f, textSize.width + offset, textSize.height + offset);
        UILabel *label = [[UILabel alloc] initWithFrame:rect];
        label.backgroundColor = [UIColor clearColor];
        label.text = text;
        label.textColor = DefFontColor6;
        label.font = font;
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        
        _contentView = [[UIButton alloc] initWithFrame:rect];
        _contentView.layer.cornerRadius = 5.0f;
        _contentView.layer.borderWidth = 1.0f;
        _contentView.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.5].CGColor;
        _contentView.backgroundColor = [UIColor colorWithRed:0.2f
                                                      green:0.2f
                                                       blue:0.2f
                                                      alpha:0.75f];
        _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _contentView.alpha = 0.0f;
        [_contentView addSubview:label];
        [label release];
    }
    
    return self;
}

- (void)dealloc
{
    T4_RELEASE_SAFELY(_contentView);
    [super dealloc];
}

-(void)dismissToast
{
    [self removeFromSuperview];
}

-(void)showAnimation{
    [UIView beginAnimations:@"show" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.3];
    _contentView.alpha = 1.0f;
    [UIView commitAnimations];
}

-(void)hideAnimation{
    [UIView beginAnimations:@"hide" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(dismissToast)];
    [UIView setAnimationDuration:0.3];
    _contentView.alpha = 0.0f;
    [UIView commitAnimations];
}

- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _contentView.center = window.center;
    [window addSubview:_contentView];
    [self showAnimation];
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:defDelaySecond];
}

+ (void)showWithText:(NSString*)text
{
    T4Toast *toast = [[[T4Toast alloc] initWithText:text] autorelease];
    [toast show];
}

@end

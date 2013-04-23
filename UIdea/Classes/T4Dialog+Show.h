//
//  T4Dialog+T4Dialog_Show.h
//  UIdea
//
//  Created by Xiaohui on 13-4-21.
//  Copyright (c) 2013年 Team4. All rights reserved.
//

#import "T4Dialog.h"

@protocol T4EditDialogDelegate <NSObject>

- (void)editDoneWithText:(NSString *)text;

@end

@protocol T4OptionsDialogDelegate <NSObject>

- (void)onClickAlbum:(id)sender;
- (void)onClickCamera:(id)sender;
- (void)onClickWidget:(id)sender;

@end

@interface T4Dialog (Show)

+ (void)showEditDialogWithDelegate:(id)delegate;
+ (void)showOptionsDialogWithDelegate:(id)delegate;

@end

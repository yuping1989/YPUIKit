//
//  YPControl.m
//  ChangQingQuan
//
//  Created by 喻平 on 15/4/16.
//  Copyright (c) 2015年 com.ucqq.ChangQingQuan. All rights reserved.
//

#import "YPControl.h"

@interface YPControl ()

@property (nonatomic, strong) UIColor *normalBackgroundlColor;

@end

@implementation YPControl

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self _setup];
}

- (void)_setup {
    self.highlightBackgroundColor = [UIColor colorWithWhite:0.85f alpha:1.0f];
    self.normalBackgroundlColor = self.backgroundColor;
    
    [self addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(touchExit) forControlEvents:
     UIControlEventTouchUpInside |
     UIControlEventTouchUpOutside |
     UIControlEventTouchCancel |
     UIControlEventTouchDragExit];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:backgroundColor];
    self.normalBackgroundlColor = backgroundColor;
}

- (void)touchDown {
    if ([self.allTargets count] > 2) {
        [super setBackgroundColor:self.highlightBackgroundColor];
    }
}

- (void)touchExit {
    [super setBackgroundColor:self.normalBackgroundlColor];
}

@end

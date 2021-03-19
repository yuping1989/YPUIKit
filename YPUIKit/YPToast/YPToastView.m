//
//  YPToastView.m
//  YPUIKit
//
//  Created by 喻平 on 2020/3/5.
//  Copyright © 2020 migu. All rights reserved.
//

#import "YPToastView.h"
#import <Masonry.h>

@interface YPToastView ()

@end


@implementation YPToastView

+ (NSArray *)allToastsInView:(UIView *)view {
    NSMutableArray *array = [NSMutableArray array];
    for (UIView *v in view.subviews) {
        if ([v isKindOfClass:[self class]]) {
            [array addObject:v];
        }
    }
    return array;
}

+ (void)hideAllToastsInView:(UIView *)view {
    NSArray *toasts = [self allToastsInView:view];
    [toasts makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self _setup];
    }
    return self;
}

- (instancetype)initWithText:(NSString *)text {
    self = [super init];
    if (self) {
        [self _setup];
        self.text = text;
    }
    return self;
}

- (void)_setup {
    _autoHide = YES;
    
    _insets = UIEdgeInsetsMake(12, 15, -12, -15);
    _textImageSpace = 8;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        _maxWidth = 300;
    } else {
        _maxWidth = [UIScreen mainScreen].bounds.size.width - 60;
    }
    
    self.backgroundColor = [UIColor colorWithWhite:0.15f alpha:1];
    self.layer.cornerRadius = 5;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    
    self.textLabel.text = text;
    if ([YPToastView appearance].hideAfterDelay <= 0.0f) {
        self.hideAfterDelay = text.length > 6 ? 2.0f : 1.5f;
    }
}

- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    self.textLabel.font = textFont;
}

- (void)showInView:(UIView *)view {
    if (!view) {
        view = [YPToastView lastWindow];
    }
    
    [YPToastView hideAllToastsInView:view];
    [view addSubview:self];
    
    CGFloat maxWidth = self.maxWidth - self.insets.left + self.insets.right;
    
    if (self.image) {
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.textLabel];
        
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
        }];
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_bottom).offset(self.textImageSpace);
            make.bottom.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.width.mas_lessThanOrEqualTo(maxWidth);
        }];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.top.greaterThanOrEqualTo(self).offset(self.insets.top);
            make.left.greaterThanOrEqualTo(self).offset(self.insets.left);
            make.bottom.lessThanOrEqualTo(self).offset(self.insets.bottom);
            make.right.lessThanOrEqualTo(self).offset(self.insets.right);
            make.width.mas_greaterThanOrEqualTo(60);
        }];
    } else {
        [self addSubview:self.textLabel];
        
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.greaterThanOrEqualTo(self).offset(self.insets.top);
            make.left.greaterThanOrEqualTo(self).offset(self.insets.left);
            make.bottom.lessThanOrEqualTo(self).offset(self.insets.bottom);
            make.right.lessThanOrEqualTo(self).offset(self.insets.right);
            make.width.mas_lessThanOrEqualTo(maxWidth);
        }];
    }
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(view);
    }];
    
    self.alpha = 0;
    [UIView animateWithDuration:0.25f animations:^{
        self.alpha = 1;
    }];
    
    if (self.autoHide) {
        [self performSelector:@selector(hide) withObject:nil afterDelay:self.hideAfterDelay];
    }
}

- (void)hide {
    [UIView animateWithDuration:0.25f animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.tintColor = [UIColor whiteColor];
    }
    return _imageView;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
    }
    return _contentView;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = [UIFont boldSystemFontOfSize:17];
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.numberOfLines = 0;
        _textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _textLabel;
}

+ (UIWindow *)lastWindow {
    for (UIWindow *window in [UIApplication sharedApplication].windows.reverseObjectEnumerator) {
        if ([window isKindOfClass:[UIWindow class]] &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds)) {
            return window;
        }
    }
    return [UIApplication sharedApplication].keyWindow;
}

@end

@implementation YPToastView (Interface)

- (YPToastView *(^)(void))success {
    return ^YPToastView *(void) {
        self.image = [[UIImage imageNamed:@"YPUIKit.bundle/success"]  imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        return self;
    };
}

- (YPToastView *(^)(void))error {
    return ^YPToastView *(void) {
        self.image = [[UIImage imageNamed:@"YPUIKit.bundle/error"]  imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        return self;
    };
}

- (YPToastView *(^)(void))info {
    return ^YPToastView *(void) {
        self.image = [[UIImage imageNamed:@"YPUIKit.bundle/info"]  imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        return self;
    };
}

- (YPToastView *(^)(UIImage *))icon {
    return ^YPToastView *(UIImage *image) {
        self.image = image;
        return self;
    };
}

- (YPToastView *(^)(CGFloat num))duration {
    return ^YPToastView *(CGFloat num) {
        self.hideAfterDelay = num;
        return self;
    };
}

- (YPToastView *(^)(void))show {
    return ^YPToastView *(void) {
        [self showInView:nil];
        return self;
    };
}

- (YPToastView *(^)(void))showInFirstWindow {
    return ^YPToastView *(void) {
        [self showInView:[UIApplication sharedApplication].windows.firstObject];
        return self;
    };
}

- (YPToastView *(^)(UIView *))showInView {
    return ^YPToastView *(UIView *view) {
        [self showInView:view];
        return self;
    };
}

@end

//
//  YPPlaceHolderTextView.m
//  NBD2
//
//  Created by 喻平 on 16/2/15.
//  Copyright © 2016年 NBD2. All rights reserved.
//

#import "YPPlaceHolderTextView.h"
#import <Masonry/Masonry.h>

@interface YPPlaceHolderTextView ()

@property (nonatomic, strong) UILabel *placeholderLabel;

@end

@implementation YPPlaceHolderTextView

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
    _placeholderColor = [UIColor lightGrayColor];
    _amendInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    if (!self.placeholderLabel) {
        self.placeholderLabel = [[UILabel alloc] init];
        [self addSubview:self.placeholderLabel];
        self.placeholderLabel.font = self.font;
        self.placeholderLabel.textColor = self.placeholderColor;
        [self.placeholderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(self.textContainerInset.top + self.amendInsets.top);
            make.left.equalTo(self).offset(self.textContainerInset.left + self.amendInsets.left);
        }];
    }
    self.placeholderLabel.text = placeholder;
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    self.placeholderLabel.font = font;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)setTextContainerInset:(UIEdgeInsets)textContainerInset {
    [super setTextContainerInset:textContainerInset];
    [self.placeholderLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(self.textContainerInset.top + self.amendInsets.top);
        make.left.equalTo(self).offset(self.textContainerInset.left + self.amendInsets.left);
    }];
}

- (void)textDidChanged:(NSNotification *)notification {
    if (self.text.length == 0) {
        self.placeholderLabel.hidden = NO;
    } else {
        self.placeholderLabel.hidden = YES;
    }
}

@end

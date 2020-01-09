//
//  YPPlaceHolderTextView.h
//  NBD2
//
//  Created by 喻平 on 16/2/15.
//  Copyright © 2016年 NBD2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YPPlaceHolderTextView : UITextView

@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;

@property (nonatomic, assign) UIEdgeInsets amendInsets;

@end

//
//  ViewController.m
//  YPUIKit
//
//  Created by 喻平 on 2018/5/14.
//  Copyright © 2018年 com.yp. All rights reserved.
//

#import "ViewController.h"
#import "UIView+YPLine.h"
#import "UIView+YPProgress.h"
#import "YPPlaceHolderTextView.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet YPPlaceHolderTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textView.placeholder = @"88888888888888888888888888888888888";
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:view];
    
    [view addTopLineWithColor:[UIColor blackColor] paddingLeft:0];
    [view addBottomLineWithColor:[UIColor greenColor] paddingLeft:20];
    [view addLine:YPLineTypeLeft color:[UIColor redColor] align:0 leading:10 trailing:10 thickness:1];
    [view addLine:YPLineTypeRight color:[UIColor purpleColor] align:30 leading:0 trailing:0 thickness:10];
    [self.view showProgress];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view hideProgress];
    });
    
}

- (IBAction)buttonClicked:(id)sender {
    [UIView showSuccessToast:@"保存成功" hideAfterDelay:1.5f];
}


@end

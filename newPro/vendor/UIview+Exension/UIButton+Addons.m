//
//  UIButton+Addons.m
//  XJ_Letter
//
//  Created by user on 2018/1/30.
//  Copyright © 2018年 ZhangJ. All rights reserved.
//

#import "UIButton+Addons.h"

@implementation UIButton (Addons)
- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle AmainColor:(UIColor *)mColor countColor:(UIColor *)color WithFiled:(UITextField *)filed {
    // 倒计时时间
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    // 每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        // 倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
                [filed setEnabled:YES];
            });
        } else {
            NSInteger seconds =  timeOut;
            NSString * timeStr = [NSString stringWithFormat:@"%0.2ld",seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = [UIColor clearColor];
                [self setTitleColor:[UIColor colorWithHexString:BH_Color_Main] forState:0];
                self.layer.borderColor = [UIColor colorWithHexString:BH_Color_Main].CGColor;
                [self setTitle:[NSString stringWithFormat:@"%@%@",timeStr,subTitle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                [filed setEnabled:NO];
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}
- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle AmainColor:(UIColor *)mColor countColor:(UIColor *)color {
    // 倒计时时间
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    // 每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        // 倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        } else {
            NSInteger seconds =  timeOut;
            NSString * timeStr = [NSString stringWithFormat:@"%0.2ld",seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = [UIColor clearColor];
                [self setTitleColor:[UIColor colorWithHexString:BH_Color_Main] forState:0];
                self.layer.borderColor = [UIColor colorWithHexString:BH_Color_Main].CGColor;
                [self setTitle:[NSString stringWithFormat:@"%@%@",timeStr,subTitle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}
- (void)verticalImageAndTitle:(CGFloat)spacing {
    
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
}

@end

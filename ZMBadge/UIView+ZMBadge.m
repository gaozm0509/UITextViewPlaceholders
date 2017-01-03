//
//  UIView+ZMBadge.m
//  ZMBadge
//
//  Created by gzm on 17/1/3.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "UIView+ZMBadge.h"
#import <objc/runtime.h>

const char *kZMBadgeKey = "kZMBadgeKey";
const char *kZMBadgeLabelKey = "kZMBadgeLabelKey";

@interface UIView (ZMBadge)

@property (nonatomic, strong) UILabel *badgeLabel;

@end

@implementation UIView (ZMBadge)

- (void)setBadge:(NSString *)badge{
    if (badge) {
        
        //关联对象
        objc_setAssociatedObject(self, &kZMBadgeKey, badge, OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        //根据类型创建小红点label
        [self showBadgeWithBadgeStyle:ZMBadgeStyleNumber];
    }
    else{
        //remove小红点
        [self.badgeLabel removeFromSuperview];
    }
}

- (NSString *)badge{
    return objc_getAssociatedObject(self, &kZMBadgeKey);
}

- (void)setBadgeLabel:(UILabel *)badgeLabel{
    objc_setAssociatedObject(self, &kZMBadgeLabelKey, badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)badgeLabel{
    return objc_getAssociatedObject(self, &kZMBadgeLabelKey);
}

#pragma mark - public method

- (void)showBadge{
    [self showBadgeWithBadgeStyle:ZMBadgeStyleDot];
}

#pragma mark - pravit method


/**
 根据类型创建小红点

 @param badgeStyle 小红点类型
 */
- (void)showBadgeWithBadgeStyle:(ZMBadgeStyle)badgeStyle{
    switch (badgeStyle) {
        case ZMBadgeStyleDot:{
            if (!self.badgeLabel) {
                self.badgeLabel = [self creatBadgeLabelWithText:nil];
            }
            break;
        }
        case ZMBadgeStyleNumber:{
            if (!self.badgeLabel) {
                self.badgeLabel = [self creatBadgeLabelWithText:self.badge];
            }
            break;
        }
    }
    [self addSubview:self.badgeLabel];
}


/**
 创建BadgeLabel

 @param text BadgeLabel的text
 @return 返回BadgeLabel
 */
- (UILabel *)creatBadgeLabelWithText:(NSString *)text{
    CGFloat badgeWidth = 8;
    CGFloat selfWidth = self.frame.size.width;
    
    CGRect frame = CGRectMake(selfWidth - badgeWidth / 2, -badgeWidth / 2, badgeWidth, badgeWidth);
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.layer.cornerRadius = badgeWidth / 2;
    label.layer.masksToBounds = YES;
    label.backgroundColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:10];
    label.textColor = [UIColor whiteColor];
    label.text = text;
    
    if (text.length > 0) {
        CGFloat badgeWidth = 15;
        CGFloat badgeHeight = 15;//badge的高度，也是badge超出self的长度的2倍
        label.layer.cornerRadius = badgeWidth / 2;
        [label sizeToFit];
        if (label.frame.size.width > badgeWidth) {
            badgeWidth = label.frame.size.width + 8;
        }
        CGRect frame = CGRectMake(selfWidth - (badgeWidth - badgeHeight / 2), - badgeHeight / 2, badgeWidth, badgeHeight);
        label.frame = frame;
    }
    return label;
}

@end

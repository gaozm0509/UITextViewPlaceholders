//
//  UIView+ZMBadge.h
//  ZMBadge
//
//  Created by gzm on 17/1/3.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ZMBadgeStyle) {
    ZMBadgeStyleDot = 0,//很小的小红点
    ZMBadgeStyleNumber,//包含数字的小红点
};

@interface UIView (ZMBadge)


/**
 显示小红点 ZMBadgeStyleDot类型
 */
- (void)showBadge;

@property (nonatomic, copy) NSString *badge;

@end

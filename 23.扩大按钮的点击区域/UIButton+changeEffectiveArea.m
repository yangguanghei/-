//
//  UIButton+changeEffectiveArea.m
//  changeEffectiveArea
//
//  Created by chenleping on 2018/9/3.
//  Copyright © 2018年 DSY. All rights reserved.
//

#import "UIButton+changeEffectiveArea.h"

#import <objc/runtime.h>

@implementation UIButton (changeEffectiveArea)

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    
    [super pointInside:point withEvent:event];
    //获取bounds 实际大小
    CGRect bounds = self.bounds;
    if (self.clickArea) {
        CGFloat area = [self.clickArea floatValue];
        CGFloat widthDelta = MAX(area * bounds.size.width - bounds.size.width, .0);
        CGFloat heightDelta = MAX(area * bounds.size.height - bounds.size.height, .0);
        //扩大bounds
        bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    }
    //点击的点在新的bounds 中 就会返回YES
    return CGRectContainsPoint(bounds, point);
}

- (void)setClickArea:(NSString *)clickArea{
    objc_setAssociatedObject(self, @selector(clickArea), clickArea, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)clickArea{
    return objc_getAssociatedObject(self, @selector(clickArea));
}

@end

//
//  DZExtendResponseView.m
//  YaoHe
//
//  Created by stonedong on 16/7/30.
//  Copyright © 2016年 stonedong. All rights reserved.
//

#import "DZExtendResponseView.h"
#import <objc/runtime.h>
#import <MRLogicInjection.h>
static void * kDZExtendResponseInset = &kDZExtendResponseInset;

NSString* const kDZExtendRClassKey  = @"__extend_response";

void DZExtendResponse(UIView* aView, UIEdgeInsets inset) {
    DZExtendResponseView* extend = (DZExtendResponseView*) MRExtendInstanceLogic (aView, @[DZExtendResponseView.class]);
    if ([extend respondsToSelector:@selector(extendResponseInsets)]) {
        extend.extendResponseInsets = inset;
    }
}

@implementation DZExtendResponseView

- (UIEdgeInsets) extendResponseInsets
{
    NSValue* value = objc_getAssociatedObject(self, kDZExtendResponseInset) ;
    if (!value) {
        return UIEdgeInsetsZero;
    }
    return [value UIEdgeInsetsValue];
}

- (void) setExtendResponseInsets:(UIEdgeInsets)extendResponseInsets
{
    objc_setAssociatedObject(self, kDZExtendResponseInset, [NSValue valueWithUIEdgeInsets:extendResponseInsets], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)  pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect rect = self.bounds;
    UIEdgeInsets inset = self.extendResponseInsets;
    rect.origin.x = inset.left;
    rect.origin.y = inset.top;
    rect.size.width = rect.size.width - inset.left - inset.right;
    rect.size.height = rect.size.height - inset.top - inset.bottom;
    return CGRectContainsPoint(rect, point);
}
@end

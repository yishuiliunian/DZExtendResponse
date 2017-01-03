//
//  DZExtendResponseView.h
//  YaoHe
//
//  Created by stonedong on 16/7/30.
//  Copyright © 2016年 stonedong. All rights reserved.
//

#import <UIKit/UIKit.h>

/* 扩展执行View的响应区域
 * @params aView 需要扩展响应区域的View的实例
 * @params inset 扩展区域的大小（增量部分）
 * */
void DZExtendResponse(UIView* aView, UIEdgeInsets inset);

/* 用来进行扩展的子类
 * */
@interface DZExtendResponseView : UIView
@property (nonatomic, assign) UIEdgeInsets extendResponseInsets;
@end

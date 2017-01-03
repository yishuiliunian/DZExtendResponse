//
//  DZExtendResponseView.h
//  YaoHe
//
//  Created by stonedong on 16/7/30.
//  Copyright © 2016年 stonedong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MRLogicInjection.h>
void DZExtendResponse(UIView* aView, UIEdgeInsets inset);

@interface DZExtendResponseView : UIView
@property (nonatomic, assign) UIEdgeInsets extendResponseInsets;
@end

//
//  FactoryUI.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FactoryUI : UIView


+ (UIView *)createLeftButtonView;

+ (UICollectionView *)createCollectionView;

+ (UIScrollView *)createScrollView;


@end

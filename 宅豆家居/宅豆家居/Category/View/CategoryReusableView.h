//
//  CategoryReusableView.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryModel.h"

@interface CategoryReusableView : UICollectionReusableView

@property (strong,nonatomic) UILabel * titleLabel;

- (void)refreshUIWithModel:(CategoryModel *)model;

@end

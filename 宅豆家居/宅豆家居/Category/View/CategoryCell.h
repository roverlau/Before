//
//  CategoryCell.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChildrenModel.h"

@interface CategoryCell : UICollectionViewCell

@property (strong,nonatomic) UIImageView * pic;

@property (strong,nonatomic) UILabel * name;


- (void)refreshUIWithModel:(ChildrenModel *)model;

@end

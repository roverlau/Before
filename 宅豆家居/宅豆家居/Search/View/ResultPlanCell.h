//
//  ResultPlanCell.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultPlanModel.h"

@interface ResultPlanCell : UICollectionViewCell

@property (strong,nonatomic) UIImageView * picImg;

@property (strong,nonatomic) UILabel * titleLabel;

- (void)refreshUIWithModel:(ResultPlanModel *)model;

@end

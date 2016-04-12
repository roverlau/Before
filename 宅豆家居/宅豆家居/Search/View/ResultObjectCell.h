//
//  ResultObjectCell.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultObjectModel.h"

@interface ResultObjectCell : UICollectionViewCell

@property (strong,nonatomic) UIImageView * picImg;

@property (strong,nonatomic) UILabel * titleLabel;

@property (strong,nonatomic) UILabel * priceLabel;

- (void)refreshUIWithModel:(ResultObjectModel *)model;

@end

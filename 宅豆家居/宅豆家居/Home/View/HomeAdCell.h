//
//  HomeAdCell.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeAdModel.h"

@interface HomeAdCell : UITableViewCell

@property (strong,nonatomic) UIImageView * imgView;
@property (strong,nonatomic) UILabel * disLabel;
@property (strong,nonatomic) UILabel * titleLabel;
@property (strong,nonatomic) UILabel * timeLabel;

- (void)refreshUIWithModel:(HomeAdModel *)model;

@end

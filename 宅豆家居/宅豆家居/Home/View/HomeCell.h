//
//  HomeCell.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCellModel.h"

@interface HomeCell : UITableViewCell

@property (strong,nonatomic) UIImageView * imgView;

@property (strong,nonatomic) UILabel * titleLabel;

@property (strong,nonatomic) UIImageView * isNewMark;

- (void)refreshUIWithMOdel:(HomeCellModel *)model;

@end

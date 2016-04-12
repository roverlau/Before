//
//  ResultPlanCell.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ResultPlanCell.h"

@implementation ResultPlanCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.picImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.contentView addSubview:_picImg];
    
    UIView * blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 120, ZScreenWidth - 10, 30)];
    blackView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self.contentView addSubview:blackView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 125, ZScreenWidth - 10, 20)];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleLabel];
}

- (void)refreshUIWithModel:(ResultPlanModel *)model
{
    [self.picImg sd_setImageWithURL:[NSURL URLWithString:model.img_url]];
    
    self.titleLabel.text = model.title;
}
@end

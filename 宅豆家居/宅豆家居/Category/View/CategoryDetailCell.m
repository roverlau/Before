//
//  CategoryDetailCell.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "CategoryDetailCell.h"

@implementation CategoryDetailCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self createUI];
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 3;
        
    }
    return self;
}

- (void)createUI
{
    self.picImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 50)];
    [self.contentView addSubview:_picImg];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 50,self.frame.size.width, 30)];
    _titleLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_titleLabel];
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 30,self.frame.size.width, 30)];
    _priceLabel.font = [UIFont systemFontOfSize:12];
    [self.priceLabel setTextColor:[UIColor colorWithRed:238/255.0 green:96/255.0 blue:106/255.0 alpha:1.0]];
    [self.contentView addSubview:_priceLabel];
    
}

- (void)refreshUIWithModel:(CategoryDetailModel *)model
{
    [self.picImg sd_setImageWithURL:[NSURL URLWithString:model.pic_url]];
    self.titleLabel.text = model.title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@元",model.price];
}


@end

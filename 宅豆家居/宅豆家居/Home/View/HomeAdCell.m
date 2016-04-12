//
//  HomeAdCell.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "HomeAdCell.h"
#import "HomeAdModel.h"

@implementation HomeAdCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.frame = CGRectMake(0, 0, ZScreenWidth, 180);
        self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, ZScreenWidth - 10, 150)];
    [self addSubview:_imgView];
    _imgView.layer.cornerRadius = 3;
    _imgView.clipsToBounds = YES;
    UIImageView * tipImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 35, 45)];
    tipImgView.image = [UIImage imageNamed:@"tip.png"];
    [self addSubview:tipImgView];
    //特卖标签
    UILabel * tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 25, 15)];
    tipLabel.center = CGPointMake(17.25, 18);
    tipLabel.text = @"特卖";
    tipLabel.font = [UIFont systemFontOfSize:11];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.textColor = [UIColor whiteColor];
    [tipImgView addSubview:tipLabel];
    
    
    UIView * whiteView = [[UIView alloc] initWithFrame:CGRectMake(5, self.imgView.frame.size.height, ZScreenWidth - 10, 30)];
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.cornerRadius = 2;
    self.disLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [self.disLabel setTextColor:[UIColor colorWithRed:238/255.0 green:96/255.0 blue:106/255.0 alpha:1.0]];
    self.disLabel.font = [UIFont systemFontOfSize:12];
    self.disLabel.textAlignment = NSTextAlignmentCenter;
    [whiteView addSubview:self.disLabel];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, 0, ZScreenWidth - 140, 30)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:12];
//    [self.titleLabel setTextColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0]];
    [whiteView addSubview:self.titleLabel];
    
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(ZScreenWidth - 70, 0, 70, 30)];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.font = [UIFont systemFontOfSize:10];
    [self.timeLabel setTextColor:[UIColor colorWithRed:77/255.0 green:77/255.0 blue:77/255.0 alpha:1.0]];
    [whiteView addSubview:self.timeLabel];
    
    [self.contentView addSubview:whiteView];
}

- (void)refreshUIWithModel:(HomeAdModel *)model
{
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.banner]];
    self.disLabel.text = model.tags;
    self.titleLabel.text = model.title;
    self.timeLabel.text = [NSString stringWithFormat:@"剩余%@天",model.over_day];
}

@end

//
//  HomeCell.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.frame = CGRectMake(0,0,ZScreenWidth, 150);
        self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, ZScreenWidth - 10, 145)];
    _imgView.layer.cornerRadius = 3;
    _imgView.clipsToBounds = YES;
    [self addSubview:_imgView];
    
    UIView * blackView = [[UIView alloc] initWithFrame:CGRectMake(5, 120, ZScreenWidth - 10, 30)];
    blackView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self addSubview:blackView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 125, (ZScreenWidth - 10)/3.0*2, 20)];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_titleLabel];
    
    self.isNewMark = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
    _isNewMark.image = [UIImage imageNamed:@"new-label"];
    _isNewMark.hidden = YES;
    [self.contentView addSubview:_isNewMark];
}

-(void)refreshUIWithMOdel:(HomeCellModel *)model
{
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.img_url]];
    self.titleLabel.text = model.title;
    if ([model.is_new isEqual:@"1"])
    {
        _isNewMark.hidden = NO;
    }
    else
    {
        _isNewMark.hidden = YES;
    }
}

@end

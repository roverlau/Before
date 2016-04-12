//
//  CategoryCell.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "CategoryCell.h"


@implementation CategoryCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.pic = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ZScreenWidth/12, ZScreenWidth/12)];
    _pic.center = CGPointMake(ZScreenWidth/8.0, ZScreenWidth/8.0 -10);
    [self addSubview:_pic];
    
    self.name = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ZScreenWidth/4.0, ZScreenWidth/8.0)];
    _name.center = CGPointMake(ZScreenWidth/8.0, ZScreenWidth/8.0 +25);
    _name.textAlignment = NSTextAlignmentCenter;
    _name.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:_name];
    
    [self.contentView bringSubviewToFront:_pic];
}

- (void)refreshUIWithModel:(ChildrenModel *)model
{
    [self.pic sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@",model.pic_url]]];

    self.name.text = model.name;
}

@end

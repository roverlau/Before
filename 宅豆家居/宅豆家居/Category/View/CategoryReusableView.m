//
//  CategoryReusableView.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "CategoryReusableView.h"

@implementation CategoryReusableView

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
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, ZScreenWidth, 30)];
    _titleLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_titleLabel];
}

- (void)refreshUIWithModel:(CategoryModel *)model
{
    self.titleLabel.text = model.name;
}

@end

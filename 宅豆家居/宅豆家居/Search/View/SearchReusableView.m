//
//  SearchReusableView.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SearchReusableView.h"

@implementation SearchReusableView

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
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 10)];
    _title.font = [UIFont systemFontOfSize:12];
    [self addSubview:_title];
}

- (void)refreshUIWith:(NSString *)title
{
    self.title.text = title;
}
@end

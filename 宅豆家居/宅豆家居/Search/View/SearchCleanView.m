//
//  SearchCleanView.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SearchCleanView.h"

@implementation SearchCleanView

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
    self.clean = [UIButton buttonWithType:UIButtonTypeCustom];
    _clean.frame = CGRectMake(0, 10, 20, 25);
    _clean.center = CGPointMake(ZScreenWidth/2, self.frame.size.height/2);
//    _clean.titleLabel.font = [UIFont systemFontOfSize:12];
//    [_clean setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [_clean setTitle:@"清除所有历史" forState:UIControlStateNormal];
    [_clean setBackgroundImage:[UIImage imageNamed:@"btn_trash"] forState:UIControlStateNormal];
    [_clean addTarget:self action:@selector(sendCleanOrder) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_clean];
    
    UIView * line = [[UIView alloc] initWithFrame:CGRectMake(15, 1, ZScreenWidth-30, 1)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
}

- (void)sendCleanOrder
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"shouldCleanHistory" object:self];
}

@end
